defmodule ESI.API.Incursion do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type incursions_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of current incursions

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_incursions`
  - `path` -- `/incursions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Incursions/get_incursions)

  """
  @spec incursions(opts :: incursions_opts) :: ESI.Request.t
  def incursions(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "incursions",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end