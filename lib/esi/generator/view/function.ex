defmodule ESI.Generator.View.Function do
  require EEx

  alias ESI.Generator.{Function, Endpoint, SwaggerType}

  EEx.function_from_file :def, :render, Path.join(~w(templates function.eex)), [:function], trim: true

  defp description(function) do
    function.info["description"]
    |> String.split("\n")
    |> hd
    |> String.trim_trailing(".")
    |> String.replace_suffix("", ".")
    |> left_pad(2)
  end

  defp has_response_example?(function) do
    !!ESI.Generator.Function.response_example(function)
  end

  defp formatted_response_example(function) do
    {_, example} = ESI.Generator.Function.response_example(function)
    pad(6) <> String.replace(inspect(example, pretty: true), "\n", "\n      ")
  end

  defp response_example_description(function) do
    ESI.Generator.Function.response_example(function)
    |> elem(0)
    |> String.trim_trailing(".")
    |> String.replace_suffix("", ":")
  end

  defp esi_path(%{tags: [tag | _]} = function) do
    tag <> "/" <> function.operation
  end

  defp args_spec(function) do
    function.endpoint
    |> ESI.Generator.Endpoint.args()
    |> do_args_spec(function)
    |> IO.iodata_to_binary
  end

  defp do_args_spec([], function) do
    case opts_params(function) do
      [] ->
        nil
      _ ->
        "opts :: #{function.name}_opts"
    end
  end
  defp do_args_spec(args, function) do
    list = args
    |> Enum.map(&Macro.underscore/1)
    |> Enum.map(fn param ->
      swagger_type = SwaggerType.new(function.params[param])
      ~s(#{param} :: #{swagger_type})
    end)
    |> Enum.join(", ")
    opts_args = do_args_spec([], function)
    [
      list,
      opts_args
    ]
    |> Enum.filter(&(!is_nil(&1)))
    |> Enum.join(", ")
  end

  @ignore_params_in ~w(path header)
  @ignore_opts_named ~w(datasource user_agent)

  @spec opts_params(function :: Function.t) :: [map]
  defp opts_params(function) do
    Map.values(function.params)
    |> Enum.filter(fn v ->
      !Enum.member?(@ignore_params_in, v["in"]) && !Enum.member?(@ignore_opts_named, v["name"])
    end)
  end

  def pad(n) do
    1..n
    |> Enum.map(fn _ -> " " end)
    |> Enum.join("")
  end

  def left_pad(str, n) do
    pad(n) <> str
  end

end