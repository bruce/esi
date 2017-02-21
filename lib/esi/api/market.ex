defmodule ESI.API.Market do

  @typedoc """
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
  Return a list of orders in a region

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_orders`
  - `path` -- `/markets/{region_id}/orders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_orders)

  """
  @spec orders(region_id :: integer, opts :: orders_opts) :: ESI.Request.t
  def orders(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "markets/#{region_id}/orders",
      query_opts: Keyword.take(opts, [:datasource, :order_type, :page, :type_id, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type prices_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of prices

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_prices`
  - `path` -- `/markets/prices/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_prices)

  """
  @spec prices(opts :: prices_opts) :: ESI.Request.t
  def prices(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "markets/prices",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
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
  Return all orders in a structure

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_structures_structure_id`
  - `path` -- `/markets/structures/{structure_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_structures_structure_id)

  """
  @spec structure(structure_id :: integer, opts :: structure_opts) :: ESI.Request.t
  def structure(structure_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "markets/structures/#{structure_id}",
      query_opts: Keyword.take(opts, [:datasource, :page, :token, :user_agent]),
    }
  end

  @typedoc """
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
  Return a list of historical market statistics for the specified type in a region

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_markets_region_id_history`
  - `path` -- `/markets/{region_id}/history/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_markets_region_id_history)

  """
  @spec history(region_id :: integer, opts :: history_opts) :: ESI.Request.t
  def history(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "markets/#{region_id}/history",
      query_opts: Keyword.take(opts, [:datasource, :type_id, :user_agent]),
    }
  end
end