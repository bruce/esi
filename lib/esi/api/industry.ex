defmodule ESI.API.Industry do

  @doc """
  Return a list of industry facilities

  ## Swagger

  The Swagger Operation ID for this function is `get_industry_facilities`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type facilities_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec facilities(opts :: facilities_opts) :: ESI.Request.t
  def facilities(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/industry/facilities/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Return cost indices for solar systems

  ## Swagger

  The Swagger Operation ID for this function is `get_industry_systems`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type systems_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec systems(opts :: systems_opts) :: ESI.Request.t
  def systems(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/industry/systems/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end