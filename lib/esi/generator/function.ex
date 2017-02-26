defmodule ESI.Generator.Function do
  @moduledoc false

  alias ESI.Generator.{Endpoint, Inflector}

  import Endpoint, only: [
    args: 1,
    ends_as?: 2,
    form: 1,
    namespace: 1,
    words: 1,
  ]

  @enforce_keys [
    :doc,
    :endpoint,
    :module_name,
    :operation,
    :params,
    :verb,
    :tags,
    :responses,
  ]

  defstruct [
    :doc,
    :endpoint,
    :module_name,
    :operation,
    :params,
    :verb,
    :name,
    :tags,
    :responses,
  ]

  @type t :: %__MODULE__{
    doc: String.t,
    endpoint: Endpoint.t,
    module_name: String.t,
    operation: String.t,
    params: %{String.t => map},
    verb: atom,
    name: String.t,
    responses: map,
    tags: [String.t]
  }

  def new(path, verb, info) do
    endpoint = Endpoint.new(path)
    %__MODULE__{
      endpoint: endpoint,
      operation: info["operationId"],
      module_name: generate_module_name(endpoint),
      verb: verb,
      doc: info["description"],
      params: param_mapping(info["parameters"]),
      tags: info["tags"],
      responses: info["responses"],
    } |> add_name
  end

  @spec add_name(function :: t) :: t
  defp add_name(function) do
    name = generate_name(function)
    %{function | name: name}
  end

  @spec generate_module_name(endpoint :: Endpoint.t) :: String.t
  defp generate_module_name(endpoint) do
    endpoint
    |> namespace()
    |> Inflector.singularize()
    |> Inflector.titleize()
  end

  @spec param_mapping(params :: map) :: %{String.t => map}
  defp param_mapping(params) do
    for param <- params, into: %{} do
      {param["name"], param}
    end
  end

  @verb_prefix [
    post: "create_",
    put: "update_",
    delete: "delete_"
  ]
  @unprefixed ~w(UI)
  @spec generate_name(function :: t) :: String.t
  defp generate_name(function) do
    base = do_generate_name(function.endpoint) || function.operation
    base = base |> rename(form(function.endpoint))
    if Enum.member?(@unprefixed, function.module_name) do
      base
    else
      Keyword.get(@verb_prefix, function.verb, "") <> base
    end
  end

  @spec response_example(function :: t) :: nil | {String.t, any}
  def response_example(function) do
    Enum.find_value(function.responses, fn {code, info} ->
      case String.to_integer(code) do
        value when value in 200..299 ->
          result = info["examples"]["application/json"]
          if result do
            {info["description"], result}
          end
        _ ->
          false
      end
    end)
  end

  @spec generate_name(endpoint :: Endpoint.t) :: String.t
  defp do_generate_name(endpoint) do
    cond do
      form(endpoint) == [] ->
        endpoint
        |> namespace()
      words(endpoint) == [] ->
        endpoint
        |> namespace()
        |> Inflector.singularize()
      args(endpoint) == [] && length(Enum.uniq(form(endpoint))) == 1 ->
        endpoint
        |> words()
        |> Enum.join("_")
      ends_as?(endpoint, [:word, :word, :arg]) ->
        endpoint
        |> words()
        |> Enum.slice(-2, 2)
        |> Enum.join("_")
        |> Inflector.singularize
      ends_as?(endpoint, [:arg, :word]) ->
        endpoint
        |> words()
        |> List.last()
      ends_as?(endpoint, [:word, :word]) ->
        # /characters/{character_id}/bookmarks/labels -> bookmark_labels
        [category, items] = Enum.slice(words(endpoint), -2, 2)
        Inflector.singularize(category) <> "_" <> items
      ends_as?(endpoint, [:word, :arg]) ->
        last_arg = List.last(args(endpoint))
        last_word = List.last(words(endpoint))
        if Inflector.singularize(last_word) <> "_id" == last_arg do
          # /characters/{character_id}/planets/{planet_id}/ -> planet
          Inflector.singularize(last_word)
        else
          # /characters/{character_id}/calendar/{event_id}/ -> calendar_event
          Inflector.singularize(last_word) <> "_" <> String.replace_suffix(last_arg, "_id", "")
        end
      form(endpoint) == [:arg] ->
        endpoint
        |> namespace()
        |> Inflector.singularize()
      true ->
        nil
    end
  end

  @function_renames %{
    {"corporationhistory", [:arg, :word]} => "corporation_history",
    {"alliancehistory", [:arg, :word]} => "alliance_history",
    {"mail", [:arg, :word, :arg]} => "mail_item",
    {"autopilot_waypoint", [:word, :word]} => "set_autopilot_waypoint",
    {"openwindow_contract", [:word, :word]} => "open_contract_window",
    {"openwindow_information", [:word, :word]} => "open_information_window",
    {"openwindow_marketdetails", [:word, :word]} => "open_market_details_window",
    {"openwindow_newmail", [:word, :word]} => "open_new_mail_window",
  }
  @spec rename(String.t, String.t) :: String.t
  for {{old, form}, new} <- @function_renames do
    defp rename(unquote(old), unquote(form)), do: unquote(new)
  end
  defp rename(name, _), do: name

end