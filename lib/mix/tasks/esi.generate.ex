defmodule Mix.Tasks.Esi.Generate do
  use Mix.Task

  @shortdoc "Regenerates modules based on the Swagger definition"

  @moduledoc """
  """

  def run(_) do
    Application.ensure_all_started(:esi)
    functions_by_module = swagger()
    |> Map.get("paths", [])
    |> Enum.flat_map(fn {path, requests} ->
      requests
      |> Enum.map(fn {verb, info} ->
        identify(path, verb, info)
      end)
    end)
    |> Enum.group_by(&Map.get(&1, :module_name))
    |> Enum.each(fn {module_name, functions} ->
      content = write_module(module_name, functions)
      name = Macro.underscore(module_name)
      path = Path.join([File.cwd!, "lib/esi/api", "#{name}.ex"])
      File.write!(path, content, [:write])
      Mix.shell.info(path)
    end)
  end

  @spec swagger() :: map
  defp swagger() do
    Path.join([:code.priv_dir(:esi), "swagger.json"])
    |> File.read!
    |> Poison.decode!
  end

  defp identify(path, verb, info) do
    parts = path
    |> Path.split
    |> Enum.drop(1)
    module_name = List.first(parts)
    |> generate_module_name()
    data = Enum.reduce(Enum.drop(parts, 1), %{args: [], words: []}, fn part, acc ->
      case Regex.run(~r/^\{(.+?)\}$/, part) do
        nil ->
          %{acc | words: [part | acc.words]}
        [_, value] ->
          %{acc | args: [value | acc.args]}
      end
    end)
    Map.merge(data, %{path: path, args: Enum.reverse(data.args), operation: info["operationId"], module_name: module_name, verb: verb, doc: info["description"], params: param_mapping(info["parameters"])})
  end

  @custom_names %{
    "ui" => "UI"
  }
  for {name, mod_name} <- @custom_names do
    defp generate_module_name(unquote(name)) do
      unquote(mod_name)
    end
  end
  defp generate_module_name(name) do
    name
    |> String.replace_suffix("s", "")
    |> Macro.camelize
  end

  defp write_module(name, functions) do
    [
      "defmodule ESI.API.#{name} do",
      Enum.map(functions, &write_function/1),
      ["\n", "end"]
    ]
  end

  def write_doc(ident) do
    doc = ident.doc |> String.split("\n") |> Enum.take(1)
    if doc do
      [
        ~S(  @doc """),
        ["  ", doc],
        "",
        "  ## Swagger",
        "",
        "  The Swagger Operation ID for this function is `#{ident.operation}`",
        "",
        "  ## Options",
        "",
        Enum.map(opts_params(ident), fn param ->
          "  - `:#{param["name"]}` #{param_req_tag(param)}-- #{param["description"]}"
        end) |> flow,
        ~S(  """)
      ] |> flow
    end
  end

  def write_function(ident) do
    ident = Map.put(ident, :function_name, function_name(ident))
    [
      "\n",
      write_doc(ident),
      write_opts_type(ident),
      "  @spec #{ident.function_name}(#{write_spec_args(ident)}) :: ESI.Request.t",
      "  def #{ident.function_name}(#{write_args(ident)}) do",
      write_request(ident),
      "  end"
    ] |> flow
  end

  def function_name(%{verb: "delete"} = ident) do
    "delete_" <> singularize(function_name(%{ident | verb: "get"}))
  end
  def function_name(%{verb: "put"} = ident) do
    "update_" <> singularize(function_name(%{ident | verb: "get"}))
  end
  def function_name(%{verb: "post"} = ident) do
    "create_" <> singularize(function_name(%{ident | verb: "get"}))
  end
  def function_name(%{words: [_| _], args: []} = ident) do
    ident.words |> Enum.join("_")
  end
  def function_name(%{words: [singular], args: []} = ident) do
    singular
  end
  def function_name(%{words: [_ | _]} = ident) do
    ident.words |> List.last
  end
  def function_name(%{words: [], args: []} = ident) do
    "list"
  end
  def function_name(%{words: [], args: [plural]} = ident) do
    String.replace_suffix(plural, "s", "")
  end
  def function_name(%{words: [], args: [_ | _]} = ident) do
    ident.module_name
    |> Macro.underscore
  end
  def function_name(ident) do
    raise "Could not handle #{inspect(ident)}"
  end

  defp write_request(ident) do
    spaces = "    "
    [
      [spaces, "%ESI.Request{"],
      [spaces, "  ", ~s(verb: :#{ident.verb},)],
      [spaces, "  ", ~s(path: #{write_path(ident)},)],
      Enum.map(split_opts(ident), &[spaces, "  ", &1, ","]) |> flow,
      [spaces, "}"]
    ] |> flow
  end

  @ignore_params ~w(path header)

  defp opts_params(ident) do
    Map.values(ident.params)
    |> Enum.filter(fn v -> !Enum.member?(@ignore_params, v["in"]) end)
  end

  defp split_opts(ident) do
    opts_params(ident)
    |> Enum.group_by(fn v -> v["in"] end)
    |> Enum.map(fn {section, params} ->
      contents = Enum.map(params, fn %{"name" => name} -> ":#{name}" end)
      |> Enum.join(", ")
      "#{section}_opts: Keyword.take(opts, [#{contents}])"
    end)
  end

  defp write_path(identity) do
    value = Regex.replace(~r/\{(.*?)\}/, identity.path, ~S(#{) <> "\\1" <> "}")
    ~s("#{value}")
  end

  defp write_opts_type(ident) do
    [
      "  @type #{ident.function_name}_opts :: [",
      Enum.map(opts_params(ident), fn param ->
        ~s<    #{param["name"]}: #{param_type(param)},>
      end) |> flow,
      "  ]"
    ] |> flow
  end

  defp write_spec_args(%{args: []} = identity) do
    "opts :: #{identity.function_name}_opts"
  end
  defp write_spec_args(ident) do
    list = ident.args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.map(fn param ->
      ~s(#{param} :: #{param_type(ident.params[param])})
    end)
    |> Enum.join(", ")
    list <> ", " <> write_spec_args(%{ident | args: []})
  end

  defp write_args(%{args: []}) do
    "opts \\\\ []"
  end
  defp write_args(ident) do
    list = ident.args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.join(", ")
    list <> ", " <> write_args(%{ident | args: []})
  end

  defp singularize(word), do: String.replace_suffix(word, "s", "")

  defp flow(block) do
    Enum.intersperse(List.wrap(block), "\n")
  end

  defp param_mapping(params) do
    for param <- params, into: %{} do
      {param["name"], param}
    end
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
    text = Enum.map(values, fn v ->
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
  defp param_type(%{"type" => raw} = param) do
    raise "Unknown param type: #{inspect(param)}"
  end

  defp nullable(spec, %{"required" => true}) do
    spec
  end
  defp nullable(spec, _) do
    "nil | #{spec}"
  end

end