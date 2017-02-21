defmodule ESI.API.Insurance do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type prices_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]


  @doc """
  Return available insurance levels for all ship types

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
      path: "insurance/prices",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end
end