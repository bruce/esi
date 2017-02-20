defmodule Mix.Tasks.Esi.Generate do
  use Mix.Task

  @shortdoc "Regenerates modules based on the Swagger definition"

  @moduledoc """
  """

  def run(_) do
    Application.ensure_all_started(:esi)
    swagger()
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
    data = Enum.reduce(Enum.drop(parts, 1), %{args: [], words: [], form: []}, fn part, acc ->
      case Regex.run(~r/^\{(.+?)\}$/, part) do
        nil ->
          %{acc | words: [part | acc.words], form: [:word | acc.form]}
        [_, value] ->
          %{acc | args: [value | acc.args], form: [:arg | acc.form]}
      end
    end)
    Map.merge(data, %{
      path: path,
      parts: parts,
      words: Enum.reverse(data.words),
      args: Enum.reverse(data.args),
      operation: info["operationId"],
      module_name: module_name,
      verb: verb,
      doc: info["description"],
      params: param_mapping(info["parameters"])
    })
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
    ident = Map.put(ident, :function_name, function_name(ident) |> rename_function(ident.form))
    [
      "\n",
      write_doc(ident),
      write_opts_type(ident),
      "  # #{inspect(ident.form)}",
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
  def function_name(ident) do
    cond do
      ident.form == [] ->
        ident.parts |> List.first
      ident.args == [] && length(Enum.uniq(ident.form)) == 1 ->
        Enum.join(ident.words, "_")
      ident.form == [:word, :arg] ->
        List.last(ident.words)
      Enum.take(ident.form, 2) == [:word, :word] ->
        # /characters/{character_id}/bookmarks/labels -> bookmark_labels
        [category, items] = Enum.take(Enum.reverse(ident.words), 2)
        |> Enum.reverse
        singularize(category) <> "_" <> items
      ident.form == [:arg, :word] ->
        last_arg = List.last(ident.args)
        last_word = List.last(ident.words)
        if singularize(last_word) <> "_id" == last_arg do
          # /characters/{character_id}/planets/{planet_id}/ -> planet
          singularize(last_word)
        else
          # /characters/{character_id}/calendar/{event_id}/ -> calendar_event
          singularize(last_word) <> "_" <> String.replace_suffix(last_arg, "_id", "")
        end
      Enum.take(ident.form, 3) == [:arg, :word, :word] ->
        Enum.take(Enum.reverse(ident.words), 2)
        |> Enum.reverse
        |> Enum.join("_")
        |> singularize
      ident.form == [:arg] ->
        singularize(ident.parts |> List.first)
      true ->
        ident.operation
    end
  end

  @function_renames %{
    {"corporationhistory", [:word, :arg]} => "corporation_history",
    {"mail", [:arg, :word, :arg]} => "mail_item"
  }
  for {{old, form}, new} <- @function_renames do
    defp rename_function(unquote(old), unquote(form)), do: unquote(new)
  end
  defp rename_function(name, _), do: name

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

  defp singularize("categories"), do: "category"
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