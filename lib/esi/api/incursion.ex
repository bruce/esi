defmodule ESI.API.Incursion do

  @doc """
  Return a list of current incursions

  ## Swagger

  The Swagger Operation ID for this function is `get_incursions`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type incursions_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # []
  @spec incursions(opts :: incursions_opts) :: ESI.Request.t
  def incursions(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/incursions/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end