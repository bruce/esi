defmodule ESI.API.Insurance do

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type prices_opts :: [
    language: nil | String.t,
  ]

  @type prices_result :: [[levels: [[cost: float, name: String.t, payout: float]], type_id: integer]]


  @doc """
  Return available insurance levels for all ship types.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`prices_result`](#t:prices_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_insurance_prices`
  - `path` -- `/insurance/prices/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Insurance/get_insurance_prices)

  """
  @spec prices(opts :: prices_opts) :: ESI.Request.t
  def prices(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/insurance/prices/",
      query_opts: Keyword.take(opts, [:language]),
    }
  end
end