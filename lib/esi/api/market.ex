defmodule ESI.API.Market do

  @typedoc """
  - `:order_type` (DEFAULT: `:all`) -- Filter buy/sell orders, return all orders by default. If you query without type_id, we always return both buy and sell orders.

  - `:page` (DEFAULT: `1`) -- Which page to query, only used for querying without type_id. Starting at 1

  - `:type_id` -- Return orders only for this type
  """
  @type orders_opts :: [
    order_type: String.t,
    page: nil | integer,
    type_id: nil | integer,
  ]

  @type orders_result :: [[duration: integer, is_buy_order: boolean, issued: String.t, location_id: integer, min_volume: integer, order_id: integer, price: float, range: String.t, type_id: integer, volume_remain: integer, volume_total: integer]]


  @doc """
  Return a list of orders in a region.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`orders_result`](#t:orders_result/0) type.

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
      query_opts: Keyword.take(opts, [:order_type, :page, :type_id]),
    }
  end

  @type prices_result :: [[adjusted_price: nil | float, average_price: nil | float, type_id: integer]]


  @doc """
  Return a list of prices.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`prices_result`](#t:prices_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_prices`
  - `path` -- `/markets/prices/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_prices)

  """
  @spec prices() :: ESI.Request.t
  def prices() do
    %ESI.Request{
      verb: :get,
      path: "/markets/prices/",

    }
  end

  @typedoc """
  - `:page` (DEFAULT: `1`) -- Which page to query, starting at 1
  """
  @type structure_opts :: [
    page: nil | integer,
  ]

  @type structure_result :: [[duration: integer, is_buy_order: boolean, issued: String.t, location_id: integer, min_volume: integer, order_id: integer, price: float, range: String.t, type_id: integer, volume_remain: integer, volume_total: integer]]


  @doc """
  Return all orders in a structure.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`structure_result`](#t:structure_result/0) type.

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
      query_opts: Keyword.take(opts, [:page]),
    }
  end

  @typedoc """
  - `:type_id` (REQUIRED) -- Return statistics for this type
  """
  @type history_opts :: [
    type_id: integer,
  ]

  @type history_result :: [[average: float, date: String.t, highest: float, lowest: float, order_count: integer, volume: integer]]


  @doc """
  Return a list of historical market statistics for the specified type in a region.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`history_result`](#t:history_result/0) type.

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
      query_opts: Keyword.take(opts, [:type_id]),
    }
  end
end