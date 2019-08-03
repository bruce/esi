defmodule ESI.API.Insurance do

  @typedoc """
  Options for [`Insurance.prices/1`](#prices/1).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type prices_opts :: [prices_opt]
  @type prices_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Return available insurance levels for all ship types.

  ## Response Example

  A list of insurance levels for all ship types:

      [
        %{
          "levels" => [%{"cost" => 10.01, "name" => "Basic", "payout" => 20.01}],
          "type_id" => 1
        }
      ]

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
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end