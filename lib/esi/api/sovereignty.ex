defmodule ESI.API.Sovereignty do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type campaigns_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Shows sovereignty data for campaigns.

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_campaigns`
  - `path` -- `/sovereignty/campaigns/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_campaigns)

  """
  @spec campaigns(opts :: campaigns_opts) :: ESI.Request.t
  def campaigns(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "sovereignty/campaigns",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structures_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Shows sovereignty data for structures.

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_structures`
  - `path` -- `/sovereignty/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_structures)

  """
  @spec structures(opts :: structures_opts) :: ESI.Request.t
  def structures(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "sovereignty/structures",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end