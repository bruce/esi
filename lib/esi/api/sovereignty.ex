defmodule ESI.API.Sovereignty do

  @doc """
  Shows sovereignty data for campaigns.

  ## Swagger

  The Swagger Operation ID for this function is `get_sovereignty_campaigns`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type campaigns_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec campaigns(opts :: campaigns_opts) :: ESI.Request.t
  def campaigns(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/campaigns/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Shows sovereignty data for structures.

  ## Swagger

  The Swagger Operation ID for this function is `get_sovereignty_structures`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structures_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec structures(opts :: structures_opts) :: ESI.Request.t
  def structures(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/structures/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end