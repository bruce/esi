defmodule ESI.API.Industry do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type facilities_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of industry facilities

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_industry_facilities`
  - `path` -- `/industry/facilities/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_industry_facilities)

  """
  @spec facilities(opts :: facilities_opts) :: ESI.Request.t
  def facilities(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "industry/facilities",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type systems_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return cost indices for solar systems

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_industry_systems`
  - `path` -- `/industry/systems/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_industry_systems)

  """
  @spec systems(opts :: systems_opts) :: ESI.Request.t
  def systems(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "industry/systems",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end