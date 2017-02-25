defmodule ESI.API.Insurance do

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type prices_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]


  @doc """
  Return available insurance levels for all ship types.

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