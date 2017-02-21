defmodule ESI.Generator.Endpoint do
  @moduledoc false

  @enforce_keys [:source, :components]
  defstruct [
    :source,
    :components
  ]

  @type t :: %__MODULE__{
    source: String.t,
    components: [component]
  }

  @type component_kind :: :arg | :word
  @type component :: {component_kind, String.t}

  @doc """
  Create an endpoint from a string
  """
  @spec new(source :: String.t) :: t
  def new(source) do
    %__MODULE__{
      source: source,
      components: parse_components(source),
    }
  end

  @doc """
  Get the namespace of the endpoint.

  ## Examples

      Endpoint.new("/universe/constellations/")
      |> Endpoint.namespace()
      # => "universe"

  """
  @spec namespace(endpoint :: t) :: String.t
  def namespace(endpoint) do
    endpoint.components
    |> hd
    |> elem(1)
  end

  @doc """
  Get the portion of the endpoint after the namespace.

  ## Examples

      Endpoint.new("/universe/items/{item_id}")
      |> Endpoint.subject()
      # => [{:word, "items"}, {:arg, "item_id"}]

  """
  @spec subject(endpoint :: t) :: [component]
  def subject(endpoint) do
    endpoint.components
    |> tl
  end

  @doc """
  Get the structural form of the endpoint subject.

  ## Examples

      Endpoint.new("/universe/items/{item_id}/things")
      |> Endpoint.form()
      # => [:word, :arg, :word]

  """
  @spec form(endpoint :: t) :: [component_kind]
  def form(endpoint) do
    for {kind, _} <- subject(endpoint) do
      kind
    end
  end

  @doc """
  Get the word values of the endpoint subject.

  ## Examples

      Endpoint.new("/universe/items/{item_id}/things")
      |> Endpoint.words()
      # => ["items", "things"]
  """
  @spec words(endpoint :: t) :: [String.t]
  def words(endpoint) do
    endpoint
    |> subject()
    |> Keyword.get_values(:word)
  end

  @doc """
  Get the args values of the endpoint subject.

  ## Examples

      Endpoint.new("/universe/items/{item_id}/things")
      |> Endpoint.words()
      # => ["item_id"]
  """
  @spec args(endpoint :: t) :: [String.t]
  def args(endpoint) do
    endpoint
    |> subject()
    |> Keyword.get_values(:arg)
  end

  @doc """
  Convert to Elixir source (a string literal with interpolation)
  """
  @spec to_ex(t) :: String.t
  def to_ex(endpoint) do
    inside = endpoint.components
    |> Enum.map(fn
      {:arg, name} ->
        ~S<#{> <> name <> ~S<}>
      {:word, value} ->
        value
    end)
    |> Path.join
    ~S<"> <> inside <> ~S<">
  end

  @spec ends_as?(endpoint :: t, structure :: [component_kind]) :: boolean
  def ends_as?(endpoint, structure) do
    structure = List.wrap(structure)
    candidate = endpoint
    |> form()
    |> Enum.slice(-(length(structure)), length(structure))
    structure == candidate
  end

  @spec parse_components(source :: String.t) :: [component]
  defp parse_components(source) do
    source
    |> Path.split
    |> Enum.reduce([], fn
      "/", acc ->
        acc
      part, acc ->
        case Regex.run(~r/^\{(.+?)\}$/, part) do
          nil ->
            [{:word, part} | acc]
          [_, value] ->
            [{:arg, value} | acc]
        end
    end)
    |> Enum.reverse
  end

end