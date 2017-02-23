defmodule ESI.Generator.SwaggerType do

  @enforce_keys [:node, :ancestors, :kind]

  defstruct [
    :node,
    :ancestors,
    :kind,
    force_required: false
  ]

  @type type_node :: any

  @type t :: %__MODULE__{
    node: type_node,
    ancestors: [t],
    kind: :parameter | :result,
    force_required: boolean
  }

  @spec new(node :: type_node, kind :: :parameter | :result, ancestors :: [t]) :: t
  def new(node, kind, ancestors \\ []) do
    %__MODULE__{
      node: node,
      kind: kind,
      ancestors: ancestors,
    }
  end

  @spec level(t) :: non_neg_integer
  def level(swagger_type) do
    length(swagger_type.ancestors)
  end

  @spec nullable?(t) :: boolean
  def nullable?(%{force_required: true}), do: false
  def nullable?(%{node: %{"required" => true}}), do: false
  def nullable?(%{ancestors: [%{node: %{"type" => "array"}} | _]}), do: false
  def nullable?(%{node: %{"name" => name}, ancestors: [%{node: %{"schema" => %{"required" => required}}} | _]}) do
    !Enum.member?(required, name)
  end
  def nullable?(%{node: %{"name" => name}, ancestors: [%{node: %{"required" => required}} | _]}) when is_list(required) do
    !Enum.member?(required, name)
  end
  def nullable?(_), do: true

end

defimpl String.Chars, for: ESI.Generator.SwaggerType do

  alias ESI.Generator.SwaggerType

  @param_types %{
    "string" => "String.t",
    "integer" => "integer",
    "boolean" => "boolean",
  }

  @spec to_string(Swagger.Type.t) :: [SwaggerType.t]
  def to_string(%{kind: :parameter, node: %{"enum" => values}} = swagger_type) do
    Enum.map(values, &(String.to_atom(&1) |> inspect))
    |> to_alternatives(swagger_type)
  end
  def to_string(%{kind: :result, node: %{"enum" => values}} = swagger_type) do
    "String.t"
    |> to_alternatives(swagger_type)
  end
  for {pattern, type} <- @param_types do
    def to_string(%{node: %{"type" => unquote(pattern)}} = swagger_type) do
      unquote(type)
      |> to_alternatives(swagger_type)
    end
  end
  def to_string(%{node: %{"type" => "number", "format" => "float"}} = swagger_type) do
    "float" |> to_alternatives(swagger_type)
  end
  def to_string(%{node: %{"type" => "number", "format" => "double"}} = swagger_type) do
    "integer" |> to_alternatives(swagger_type)
  end
  def to_string(%{node: %{"type" => "array"} = param} = swagger_type) do
    internal = child(param["items"], swagger_type)
    "[#{internal}]" |> to_alternatives(swagger_type)
  end
  def to_string(%{node: %{"schema" => %{"properties" => props}}} = swagger_type) do
    internal = for {name, prop} <- props do
      prop = Map.put(prop, "name", name)
      ~s<#{name}: #{child(prop, swagger_type)}>
    end
    internal = internal |> Enum.join(", ")
    "[#{internal}]" |> to_alternatives(swagger_type)
  end
  def to_string(%{node: %{"schema" => %{"items" => items}}} = swagger_type) do
    internal = child(items, swagger_type)
    "[#{internal}]" |> to_alternatives(swagger_type)
  end
  def to_string(%{node: %{"properties" => props}} = swagger_type) do
    internal = for {name, prop} <- props do
      prop = Map.put(prop, "name", name)
      ~s<#{name}: #{child(prop, swagger_type)}>
    end
    |> Enum.join(", ")
    "[#{internal}]" |> to_alternatives(swagger_type)
  end
  def to_string(%{node: %{"type" => _} = param} = swagger_type) do
    raise "Unknown param type: #{inspect(param)}"
  end

  @spec child(value :: SwaggerType.type_node, SwaggerType.t) :: SwaggerType.t
  defp child(value, swagger_type) do
    ESI.Generator.SwaggerType.new(
      value,
      swagger_type.kind,
      [swagger_type | swagger_type.ancestors]
    )
  end

  @spec to_alternatives(alternatives :: String.t | [String.t], swagger_type :: SwaggerType.t) :: String.t
  defp to_alternatives(alternatives, swagger_type) do
    List.wrap(alternatives)
    |> prefix_if_nullable(swagger_type)
    |> Enum.join(" | ")
  end

  @spec prefix_if_nullable(alternatives :: [String.t], swagger_type :: SwaggerType.t) :: [String.t]
  defp prefix_if_nullable(alternatives, swagger_type) do
    if SwaggerType.nullable?(swagger_type) do
      ["nil" | alternatives]
    else
      alternatives
    end
  end

end