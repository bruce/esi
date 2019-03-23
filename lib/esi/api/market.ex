defmodule ESI.API.Market do
  @doc """
  Get a list of item groups.

  ## Response Example

  A list of item group ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_groups`
  - `path` -- `/markets/groups/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_groups)

  """
  @spec groups() :: ESI.Request.t()
  def groups() do
    %ESI.Request{
      verb: :get,
      path: "/markets/groups/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Market.orders/2`](#orders/2).

  - `:order_type` (DEFAULT: `:all`) -- Filter buy/sell orders, return all orders by default. If you query without type_id, we always return both buy and sell orders
  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:type_id` -- Return orders only for this type
  """
  @type orders_opts :: [orders_opt]
  @type orders_opt ::
          {:order_type, :buy | :sell | :all} | {:page, nil | integer} | {:type_id, nil | integer}

  @doc """
  Return a list of orders in a region.

  ## Response Example

  A list of orders:

      [
        %{
          "duration" => 90,
          "is_buy_order" => false,
          "issued" => "2016-09-03T05:12:25Z",
          "location_id" => 60005599,
          "min_volume" => 1,
          "order_id" => 4623824223,
          "price" => 9.9,
          "range" => "region",
          "system_id" => 30000053,
          "type_id" => 34,
          "volume_remain" => 1296000,
          "volume_total" => 2000000
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_orders`
  - `path` -- `/markets/{region_id}/orders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_orders)

  """
  @spec orders(region_id :: integer, opts :: orders_opts) :: ESI.Request.t()
  def orders(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/#{region_id}/orders/",
      opts_schema: %{
        datasource: {:query, :optional},
        order_type: {:query, :required},
        page: {:query, :optional},
        type_id: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @doc """
  Return a list of prices.

  ## Response Example

  A list of prices:

      [
        %{
          "adjusted_price" => 306988.09,
          "average_price" => 306292.67,
          "type_id" => 32772
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_prices`
  - `path` -- `/markets/prices/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_prices)

  """
  @spec prices() :: ESI.Request.t()
  def prices() do
    %ESI.Request{
      verb: :get,
      path: "/markets/prices/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Market.structure/2`](#structure/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type structure_opts :: [structure_opt]
  @type structure_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return all orders in a structure.

  ## Response Example

  A list of orders:

      [
        %{
          "duration" => 90,
          "is_buy_order" => false,
          "issued" => "2016-09-03T05:12:25Z",
          "location_id" => 1020988381992,
          "min_volume" => 1,
          "order_id" => 4623824223,
          "price" => 9.9,
          "range" => "region",
          "type_id" => 34,
          "volume_remain" => 1296000,
          "volume_total" => 2000000
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_structures_structure_id`
  - `path` -- `/markets/structures/{structure_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_structures_structure_id)

  """
  @spec structure(structure_id :: integer, opts :: structure_opts) :: ESI.Request.t()
  def structure(structure_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/structures/#{structure_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Market.types/2`](#types/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type types_opts :: [types_opt]
  @type types_opt :: {:page, nil | integer}

  @doc """
  Return a list of type IDs that have active orders in the region, for efficient market indexing..

  ## Response Example

  A list of type IDs:

      [587, 593, 597]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_types`
  - `path` -- `/markets/{region_id}/types/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_types)

  """
  @spec types(region_id :: integer, opts :: types_opts) :: ESI.Request.t()
  def types(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/#{region_id}/types/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Market.group_market_group/2`](#group_market_group/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type group_market_group_opts :: [group_market_group_opt]
  @type group_market_group_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}

  @doc """
  Get information on an item group.

  ## Response Example

  Information about an item group:

      %{
        "description" => "Small, fast vessels suited to a variety of purposes.",
        "market_group_id" => 5,
        "name" => "Standard Frigates",
        "parent_group_id" => 1361,
        "types" => [582, 583]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_groups_market_group_id`
  - `path` -- `/markets/groups/{market_group_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_groups_market_group_id)

  """
  @spec group_market_group(market_group_id :: integer, opts :: group_market_group_opts) ::
          ESI.Request.t()
  def group_market_group(market_group_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/groups/#{market_group_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Market.history/2`](#history/2).

  - `:type_id` (REQUIRED) -- Return statistics for this type
  """
  @type history_opts :: [history_opt]
  @type history_opt :: {:type_id, integer}

  @doc """
  Return a list of historical market statistics for the specified type in a region.

  ## Response Example

  A list of historical market statistics:

      [
        %{
          "average" => 5.25,
          "date" => "2015-05-01",
          "highest" => 5.27,
          "lowest" => 5.11,
          "order_count" => 2267,
          "volume" => 16276782035
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_history`
  - `path` -- `/markets/{region_id}/history/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_history)

  """
  @spec history(region_id :: integer, opts :: history_opts) :: ESI.Request.t()
  def history(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/#{region_id}/history/",
      opts_schema: %{datasource: {:query, :optional}, type_id: {:query, :required}},
      opts: Map.new(opts)
    }
  end
end
