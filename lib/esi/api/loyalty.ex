defmodule ESI.API.Loyalty do

  @doc """
  Return a list of offers from a specific corporation's loyalty store.

  ## Response Example

  A list of offers:

      [%{"isk_cost" => 0, "lp_cost" => 100, "offer_id" => 1, "quantity" => 1,
         "required_items" => [], "type_id" => 123},
       %{"isk_cost" => 1000, "lp_cost" => 100, "offer_id" => 2, "quantity" => 10,
         "required_items" => [%{"quantity" => 10, "type_id" => 1234}],
         "type_id" => 1235}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_loyalty_stores_corporation_id_offers`
  - `path` -- `/loyalty/stores/{corporation_id}/offers/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Loyalty/get_loyalty_stores_corporation_id_offers)

  """
  @spec offers(corporation_id :: integer) :: ESI.Request.t
  def offers(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/loyalty/stores/#{corporation_id}/offers/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end
end