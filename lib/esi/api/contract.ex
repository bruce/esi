defmodule ESI.API.Contract do
  @typedoc """
  Options for [`Contract.public_item/2`](#public_item/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type public_item_opts :: [public_item_opt]
  @type public_item_opt :: {:page, nil | integer}

  @doc """
  Lists items of a public contract.

  ## Response Example

  A list of items in this contract:

      [
        %{
          "is_included" => true,
          "item_id" => 123456,
          "quantity" => 1,
          "record_id" => 123456,
          "type_id" => 587
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_contracts_public_items_contract_id`
  - `path` -- `/contracts/public/items/{contract_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_contracts_public_items_contract_id)

  """
  @spec public_item(contract_id :: integer, opts :: public_item_opts) :: ESI.Request.t()
  def public_item(contract_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/contracts/public/items/#{contract_id}/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Contract.public_bid/2`](#public_bid/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type public_bid_opts :: [public_bid_opt]
  @type public_bid_opt :: {:page, nil | integer}

  @doc """
  Lists bids on a public auction contract.

  ## Response Example

  A list of bids:

      [%{"amount" => 1.23, "bid_id" => 1, "date_bid" => "2017-01-01T10:10:10Z"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_contracts_public_bids_contract_id`
  - `path` -- `/contracts/public/bids/{contract_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_contracts_public_bids_contract_id)

  """
  @spec public_bid(contract_id :: integer, opts :: public_bid_opts) :: ESI.Request.t()
  def public_bid(contract_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/contracts/public/bids/#{contract_id}/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Contract.public_region/2`](#public_region/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type public_region_opts :: [public_region_opt]
  @type public_region_opt :: {:page, nil | integer}

  @doc """
  Returns a paginated list of all public contracts in the given region.

  ## Response Example

  A list of contracts:

      [
        %{
          "buyout" => 10000000000.01,
          "contract_id" => 1,
          "date_expired" => "2017-06-13T13:12:32Z",
          "date_issued" => "2017-06-06T13:12:32Z",
          "days_to_complete" => 0,
          "end_location_id" => 60014719,
          "for_corporation" => true,
          "issuer_corporation_id" => 456,
          "issuer_id" => 123,
          "price" => 1000000.01,
          "reward" => 0.01,
          "start_location_id" => 60014719,
          "type" => "auction",
          "volume" => 0.01
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_contracts_public_region_id`
  - `path` -- `/contracts/public/{region_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_contracts_public_region_id)

  """
  @spec public_region(region_id :: integer, opts :: public_region_opts) :: ESI.Request.t()
  def public_region(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/contracts/public/#{region_id}/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}},
      opts: Map.new(opts)
    }
  end
end
