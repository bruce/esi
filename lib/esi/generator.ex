defmodule ESI.Generator do
  @moduledoc false

  alias ESI.Generator.{Endpoint, Function}

  def run(swagger) do
    swagger
    |> Map.get("paths", [])
    |> Enum.flat_map(fn {path, requests} ->
      requests
      |> Enum.map(fn {verb, info} ->
        Function.new(path, String.to_atom(verb), info)
      end)
    end)
    |> Enum.group_by(&(&1.module_name))
    |> Enum.each(fn {module_name, functions} ->
      content = write_module(module_name, functions)
      name = Macro.underscore(module_name)
      path = Path.join([File.cwd!, "lib/esi/api", "#{name}.ex"])
      File.write!(path, content, [:write])
      Mix.shell.info(path)
    end)
  end

  defp write_module(name, functions) do
    [
      "defmodule ESI.API.#{name} do",
      Enum.map(functions, &write_function/1),
      ["\n", "end"]
    ]
  end

  def write_doc(function) do
    doc = function.doc |> String.split("\n") |> Enum.take(1)
    if doc do
      tag = function.tags |> hd
      [
        ~S(  @doc """),
        ["  ", doc],
        "",
        "  ## Swagger Source",
        "",
        "  This function was generated from the following Swagger operation:",
        "",
        "  - `operationId` -- `#{function.operation}`",
        "  - `path` -- `#{function.endpoint.source}`",
        "",
        "  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/#{tag}/#{function.operation})",
        "",
        ~S(  """)
      ] |> flow
    end
  end

  def write_opts_typedoc(function) do
    [
      ~S(  @typedoc """),
      Enum.map(opts_params(function), fn param ->
        "  - `:#{param["name"]}` #{param_req_tag(param)}-- #{param["description"]}"
      end) |> flow,
      ~S(  """)
    ] |> flow
  end

  def write_function(function) do
    [
      "\n",
      write_opts_typedoc(function),
      write_opts_type(function),
      "\n",
      write_doc(function),
      "  @spec #{function.name}(#{write_spec_args(function)}) :: ESI.Request.t",
      "  def #{function.name}(#{write_args(function)}) do",
      write_request(function),
      "  end"
    ] |> flow
  end

  defp write_request(function) do
    spaces = "    "
    [
      [spaces, "%ESI.Request{"],
      [spaces, "  ", ~s(verb: :#{function.verb},)],
      [spaces, "  ", ~s(path: #{Endpoint.to_ex(function.endpoint)},)],
      Enum.map(split_opts(function), &[spaces, "  ", &1, ","]) |> flow,
      [spaces, "}"]
    ] |> flow
  end

  @ignore_params ~w(path header)

  defp opts_params(function) do
    Map.values(function.params)
    |> Enum.filter(fn v -> !Enum.member?(@ignore_params, v["in"]) end)
  end

  defp split_opts(function) do
    opts_params(function)
    |> Enum.group_by(fn v -> v["in"] end)
    |> Enum.map(fn {section, params} ->
      contents = Enum.map(params, fn %{"name" => name} -> ":#{name}" end)
      |> Enum.join(", ")
      "#{section}_opts: Keyword.take(opts, [#{contents}])"
    end)
  end

  defp write_opts_type(function) do
    [
      "  @type #{function.name}_opts :: [",
      Enum.map(opts_params(function), fn param ->
        ~s<    #{param["name"]}: #{param_type(param)},>
      end) |> flow,
      "  ]"
    ] |> flow
  end

  defp write_spec_args(function) do
    function.endpoint
    |> Endpoint.args()
    |> do_write_spec_args(function)
  end
  defp do_write_spec_args([], function) do
    "opts :: #{function.name}_opts"
  end
  defp do_write_spec_args(args, function) do
    list = args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.map(fn param ->
      ~s(#{param} :: #{param_type(function.params[param])})
    end)
    |> Enum.join(", ")
    list <> ", " <> do_write_spec_args([], function)
  end

  defp write_args(function) do
    function.endpoint
    |> Endpoint.args
    |> do_write_args(function)
  end
  defp do_write_args([], _) do
    "opts \\\\ []"
  end
  defp do_write_args(args, function) do
    list = args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.join(", ")
    list <> ", " <> do_write_args([], function)
  end

  defp flow(block) do
    Enum.intersperse(List.wrap(block), "\n")
  end

  defp param_req_tag(%{"default" => value, "enum" => _}) do
    ~s<(DEFAULT: `#{inspect(String.to_atom(value))}`) >
  end
  defp param_req_tag(%{"default" => value}) do
    ~s<(DEFAULT: `#{inspect(value)}`) >
  end
  defp param_req_tag(%{"required" => true}) do
    "(REQUIRED) "
  end
  defp param_req_tag(_) do
    ""
  end

  @param_types %{
    "string" => "String.t",
    "integer" => "integer",
    "boolean" => "boolean",
  }
  defp param_type(nil) do
    raise "No param type provided"
  end
  defp param_type(%{"enum" => values} = param) do
    Enum.map(values, fn v ->
      String.to_atom(v) |> inspect
    end)
    |> Enum.join(" | ")
    |> nullable(param)
  end
  for {pattern, type} <- @param_types do
    defp param_type(%{"type" => unquote(pattern)} = param), do: unquote(type) |> nullable(param)
  end
  defp param_type(%{"type" => "number", "format" => "float"} = param) do
    "float" |> nullable(param)
  end
  defp param_type(%{"type" => "array"} = param) do
    internal = param_type(param["items"])
    "[#{internal}]" |> nullable(param)
  end
  defp param_type(%{"schema" => %{"properties" => props}} = param) do
    internal = Enum.map(props, fn {name, prop} ->
      ~s<#{name}: #{param_type(prop)}>
    end)
    |> Enum.join(", ")
    "[#{internal}]" |> nullable(param)
  end
  defp param_type(%{"schema" => %{"items" => items}} = param) do
    internal = param_type(items)
    "[#{internal}]" |> nullable(param)
  end
  defp param_type(%{"properties" => props} = param) do
    internal = Enum.map(props, fn {name, prop} ->
      ~s<#{name}: #{param_type(prop)}>
    end)
    |> Enum.join(", ")
    "[#{internal}]" |> nullable(param)
  end
  defp param_type(%{"type" => _} = param) do
    raise "Unknown param type: #{inspect(param)}"
  end

  defp nullable(spec, %{"required" => true}) do
    spec
  end
  defp nullable(spec, _) do
    "nil | #{spec}"
  end


end