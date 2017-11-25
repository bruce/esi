defmodule ESI.Generator do
  @moduledoc false

  alias ESI.Generator.{Endpoint, Function, SwaggerType}

  def run(swagger) do
    write_api_version!(swagger["info"]["version"])
    swagger
    |> resolve_refs(swagger)
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

  defp write_api_version!(nil) do
    raise "Could not determine ESI Swagger Specification version number"
  end
  defp write_api_version!(value) do
    path = Path.join([File.cwd!, "lib/esi/api.ex"])
    File.write!(
      path,
      [
        "defmodule ESI.API do",
        ~s<  @doc """>,
        "  The ESI Swagger Specification version number.",
        ~s<  """>,
        "  @spec version :: String.t",
        "  def version do",
        "    #{inspect(value)}",
        "  end",
        "end"
      ] |> flow,
      [:write]
    )
    Mix.shell.info(path)
  end

  defp resolve_refs(swagger, %{"$ref" => "#/" <> ref}) do
    get_in(swagger, String.split(ref, "/"))
  end
  defp resolve_refs(swagger, value) when is_list(value) do
    for item <- value do
      resolve_refs(swagger, item)
    end
  end
  defp resolve_refs(swagger, value) when is_map(value) do
    for {key, val} <- value, into: %{} do
      {key, resolve_refs(swagger, val)}
    end
  end
  defp resolve_refs(_swagger, value) do
    value
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
        ["  ", doc, "."],
        write_response_example(Function.response_example(function)),
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
    arity = Function.arity(function, length(opts_params(function)) > 0)
    [
      ~S(  @typedoc """),
      "  Options for [`#{function.module_name}.#{function.name}/#{arity}`](##{function.name}/#{arity}).",
      "",
      Enum.map(opts_params(function), fn param ->
        "  - `:#{param["name"]}` #{param_req_tag(param)}-- #{param["description"]}"
      end) |> flow,
      ~S(  """)
    ] |> flow
  end

  def write_response_example(resp) do
    [
      "",
      "  ## Response Example",
      "",
      do_write_response_example(resp),
      "",
    ] |> List.flatten |> flow
  end

  defp do_write_response_example(nil) do
    ["  No example available."]
  end
  defp do_write_response_example({description, example}) do
    [
      "  #{description}:",
      "",
      "      " <> String.replace(inspect(example, pretty: true, charlists: :as_lists), "\n", "\n      ")
    ]
  end

  def write_function(function) do
    write_opts_type_info(function) ++ [
      "\n",
      write_doc(function),
      "  @spec #{function.name}(#{write_spec_args(function)}) :: ESI.Request.t",
      "  def #{function.name}(#{write_args(function)}) do",
      write_request(function),
      "  end"
    ] |> flow
  end

  def write_opts_type_info(function) do
    case opts_params(function) do
      [] ->
        []
      _ ->
        [
          "\n",
          write_opts_typedoc(function),
          write_opts_type(function),
        ]
    end
  end

  defp write_request(function) do
    spaces = "    "
    [
      [spaces, "%ESI.Request{"],
      [spaces, "  ", ~s(verb: :#{function.verb},)],
      [spaces, "  ", ~s(path: #{Endpoint.to_ex(function.endpoint)},)],
      [spaces, "  ", ~s(opts_schema: ), write_opts_schema(function), ","],
      write_opts(function),
      [spaces, "}"]
    ] |> flow
  end

  @ignore_params_in ~w(path header)
  @ignore_opts_named ~w(datasource user_agent)

  defp write_opts(function) do
    case opts_params(function) do
      [] ->
        []
      _ ->
        ["      ", ~s<opts: Map.new(opts),>]
    end
  end

  defp write_opts_schema(function) do
    Map.values(function.params)
    |> Enum.filter(fn v -> !Enum.member?(@ignore_params_in, v["in"]) end)
    |> Enum.map(fn v -> {String.to_atom(v["name"]), {String.to_atom(v["in"]), write_required_status(v["required"])}} end)
    |> Map.new
    |> inspect
  end

  defp write_required_status(true), do: :required
  defp write_required_status(_), do: :optional

  @spec opts_params(function :: Function.t) :: [map]
  defp opts_params(function) do
    Map.values(function.params)
    |> Enum.filter(fn v ->
      !Enum.member?(@ignore_params_in, v["in"]) && !Enum.member?(@ignore_opts_named, v["name"])
    end)
  end

  defp write_opts_type(function) do
    [
      "  @type #{function.name}_opts :: [#{function.name}_opt]",
      "  @type #{function.name}_opt :: " <> (
        Enum.map(opts_params(function), fn param ->
          swagger_type = SwaggerType.new(param)
          ~s<{:#{param["name"]}, #{swagger_type}}>
        end)
        |> Enum.join(" | ")
      )
      |> flow
    ] |> flow
  end

  defp write_spec_args(function) do
    function.endpoint
    |> Endpoint.args()
    |> do_write_spec_args(function)
  end
  defp do_write_spec_args([], function) do
    case opts_params(function) do
      [] ->
        nil
      _ ->
        "opts :: #{function.name}_opts"
    end
  end
  defp do_write_spec_args(args, function) do
    list = args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.map(fn param ->
      swagger_type = SwaggerType.new(function.params[param])
      ~s(#{param} :: #{swagger_type})
    end)
    |> Enum.join(", ")
    opts_args = do_write_spec_args([], function)
    [
      list,
      opts_args
    ]
    |> Enum.filter(&(!is_nil(&1)))
    |> Enum.join(", ")
  end

  defp write_args(function) do
    function.endpoint
    |> Endpoint.args
    |> do_write_args(function)
  end
  defp do_write_args([], function) do
    case opts_params(function) do
      [] ->
        nil
      _ ->
        "opts \\\\ []"
    end
  end
  defp do_write_args(args, function) do
    list = args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.join(", ")
    opts_args = do_write_args([], function)
    [
      list,
      opts_args
    ]
    |> Enum.filter(&(!is_nil(&1)))
    |> Enum.join(", ")
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


end
