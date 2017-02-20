defmodule ESI.Generator.Function do
  @moduledoc false

  @enforce_keys [
    :path,
    :parts,
    :words,
    :args,
    :operation,
    :module_name,
    :doc,
    :params,
    :form,
    :verb,
  ]

  defstruct [
    :path,
    :parts,
    :words,
    :args,
    :operation,
    :module_name,
    :doc,
    :params,
    :form,
    :verb,
  ]

  @type t :: %__MODULE__{
    path: String.t,
    parts: [String.t],
    words: [String.t],
    args: [String.t],
    form: [atom],
    operation: String.t,
    module_name: String.t,
    doc: String.t,
    params: %{String.t => map},
    verb: atom,
  }

  def new(path, verb, info) do
    parts = path
    |> Path.split
    |> Enum.drop(1)
    module_name = List.first(parts)
    |> generate_module_name()
    data = Enum.reduce(Enum.drop(parts, 1), %{args: [], words: [], form: []}, fn part, acc ->
      case Regex.run(~r/^\{(.+?)\}$/, part) do
        nil ->
          %{acc | words: [part | acc.words], form: [:word | acc.form]}
        [_, value] ->
          %{acc | args: [value | acc.args], form: [:arg | acc.form]}
      end
    end)
    struct(__MODULE__, Map.merge(data, %{
      path: path,
      parts: parts,
      words: Enum.reverse(data.words),
      args: Enum.reverse(data.args),
      operation: info["operationId"],
      module_name: module_name,
      verb: verb,
      doc: info["description"],
      params: param_mapping(info["parameters"])
    }))
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

  defp param_mapping(params) do
    for param <- params, into: %{} do
      {param["name"], param}
    end
  end

end