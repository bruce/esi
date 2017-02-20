defmodule ESI.Generator.Path do

  @enforce_keys [
    :source,
    :components
  ]

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

  def new(source) do
    %__MODULE__{
      source: source,
      components: parse_components(source),
    }
  end

  @spec form(path :: t) :: [component_kind]
  def form(path) do
    path.components
    |> Enum.map(&elem(&1, 0))
  end

  @spec words(path :: t) :: [String.t]
  def words(path) do
    path.components
    |> Keyword.get_values(:word)
  end

  @spec args(path :: t) :: [String.t]
  def args(path) do
    path.components
    |> Keyword.get_values(:arg)
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

  @spec to_ex(t) :: String.t
  def to_ex(path) do
    inside = path.components
    |> Enum.map(fn
      {:arg, name} ->
        ~S<#{> <> name <> ~S<}>
      {:word, value} ->
        value
    end)
    |> Path.join
    ~S<"> <> inside <> ~S<">
  end

end