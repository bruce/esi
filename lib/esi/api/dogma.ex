defmodule ESI.API.Dogma do

  @doc """
  Get information on a dogma attribute.

  ## Response Example

  Information about a dogma attribute:

      %{
        "attribute_id" => 20,
        "default_value" => 1,
        "description" => "Factor by which topspeed increases.",
        "display_name" => "Maximum Velocity Bonus",
        "high_is_good" => true,
        "icon_id" => 1389,
        "name" => "speedFactor",
        "published" => true,
        "unit_id" => 124
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_dogma_attributes_attribute_id`
  - `path` -- `/dogma/attributes/{attribute_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Dogma/get_dogma_attributes_attribute_id)

  """
  @spec attribute(attribute_id :: integer) :: ESI.Request.t
  def attribute(attribute_id) do
    %ESI.Request{
      verb: :get,
      path: "/dogma/attributes/#{attribute_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get a list of dogma attribute ids.

  ## Response Example

  A list of dogma attribute ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_dogma_attributes`
  - `path` -- `/dogma/attributes/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Dogma/get_dogma_attributes)

  """
  @spec attributes() :: ESI.Request.t
  def attributes() do
    %ESI.Request{
      verb: :get,
      path: "/dogma/attributes/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get information on a dogma effect.

  ## Response Example

  Information about a dogma effect:

      %{
        "description" => "Requires a high power slot.",
        "display_name" => "High power",
        "effect_category" => 0,
        "effect_id" => 12,
        "icon_id" => 293,
        "name" => "hiPower",
        "post_expression" => 131,
        "pre_expression" => 131,
        "published" => true
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_dogma_effects_effect_id`
  - `path` -- `/dogma/effects/{effect_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Dogma/get_dogma_effects_effect_id)

  """
  @spec effect(effect_id :: integer) :: ESI.Request.t
  def effect(effect_id) do
    %ESI.Request{
      verb: :get,
      path: "/dogma/effects/#{effect_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Returns info about a dynamic item resulting from mutation with a mutaplasmid..

  ## Response Example

  Details about a dynamic item:

      %{
        "created_by" => 2112625428,
        "dogma_attributes" => [%{"attribute_id" => 9, "value" => 350}],
        "dogma_effects" => [%{"effect_id" => 508, "is_default" => false}],
        "mutator_type_id" => 47845,
        "source_type_id" => 33103
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_dogma_dynamic_items_type_id_item_id`
  - `path` -- `/dogma/dynamic/items/{type_id}/{item_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Dogma/get_dogma_dynamic_items_type_id_item_id)

  """
  @spec get_dogma_dynamic_items_type_id_item_id(type_id :: integer, item_id :: integer) :: ESI.Request.t
  def get_dogma_dynamic_items_type_id_item_id(type_id, item_id) do
    %ESI.Request{
      verb: :get,
      path: "/dogma/dynamic/items/#{type_id}/#{item_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get a list of dogma effect ids.

  ## Response Example

  A list of dogma effect ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_dogma_effects`
  - `path` -- `/dogma/effects/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Dogma/get_dogma_effects)

  """
  @spec effects() :: ESI.Request.t
  def effects() do
    %ESI.Request{
      verb: :get,
      path: "/dogma/effects/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end
end