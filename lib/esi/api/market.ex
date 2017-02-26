defmodule ESI.API.Market do

  @typedoc """
Options for [`Market.orders/2`](#orders/2).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:order_type` (DEFAULT: `:all`) -- Filter buy/sell orders, return all orders by default. If you query without type_id, we always return both buy and sell orders.

  - `:page` (DEFAULT: `1`) -- Which page to query, only used for querying without type_id. Starting at 1

  - `:type_id` -- Return orders only for this type
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type orders_opts :: [
    datasource: nil | :tranquility | :singularity,
    order_type: :buy | :sell | :all,
    page: nil | integer,
    type_id: nil | integer,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of orders in a region.

  ## Response Example

  A list of orders:

      [%{"duration" => 90, "is_buy_order" => false,
         "issued" => "2016-09-03T05:12:25Z", "location_id" => 60005599,
         "min_volume" => 1, "order_id" => 4623824223, "price" => 9.9,
         "range" => "region", "type_id" => 34, "volume_remain" => 1296000,
         "volume_total" => 2000000}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_orders`
  - `path` -- `/markets/{region_id}/orders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_orders)

  """
  @spec orders(region_id :: integer, opts :: orders_opts) :: ESI.Request.t
  def orders(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/#{region_id}/orders/",
      opts_schema: %{datasource: {:query, :optional}, order_type: {:query, :required}, page: {:query, :optional}, type_id: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Market.prices/1`](#prices/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type prices_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of prices.

  ## Response Example

  A list of prices:

      [%{"adjusted_price" => 306988.09, "average_price" => 306292.67,
         "type_id" => 32772}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_prices`
  - `path` -- `/markets/prices/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_prices)

  """
  @spec prices(opts :: prices_opts) :: ESI.Request.t
  def prices(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/prices/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Market.structure/2`](#structure/2).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:page` (DEFAULT: `1`) -- Which page to query, starting at 1
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structure_opts :: [
    datasource: nil | :tranquility | :singularity,
    page: nil | integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Return all orders in a structure.

  ## Response Example

  A list of orders:

      [%{"duration" => 90, "is_buy_order" => false,
         "issued" => "2016-09-03T05:12:25Z", "location_id" => 60005599,
         "min_volume" => 1, "order_id" => 4623824223, "price" => 9.9,
         "range" => "region", "type_id" => 34, "volume_remain" => 1296000,
         "volume_total" => 2000000}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_structures_structure_id`
  - `path` -- `/markets/structures/{structure_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_structures_structure_id)

  """
  @spec structure(structure_id :: integer, opts :: structure_opts) :: ESI.Request.t
  def structure(structure_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/structures/#{structure_id}/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Market.history/2`](#history/2).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:type_id` (REQUIRED) -- Return statistics for this type
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type history_opts :: [
    datasource: nil | :tranquility | :singularity,
    type_id: integer,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of historical market statistics for the specified type in a region.

  ## Response Example

  A list of historical market statistics:

      [%{"average" => 5.25, "date" => "2015-05-01", "highest" => 5.27,
         "lowest" => 5.11, "order_count" => 2267, "volume" => 16276782035}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_history`
  - `path` -- `/markets/{region_id}/history/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_history)

  """
  @spec history(region_id :: integer, opts :: history_opts) :: ESI.Request.t
  def history(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/markets/#{region_id}/history/",
      opts_schema: %{datasource: {:query, :optional}, type_id: {:query, :required}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end