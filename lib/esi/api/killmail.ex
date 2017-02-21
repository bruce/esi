defmodule ESI.API.Killmail do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type killmail_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a single killmail from its ID and hash

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_killmails_killmail_id_killmail_hash`
  - `path` -- `/killmails/{killmail_id}/{killmail_hash}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Killmails/get_killmails_killmail_id_killmail_hash)

  """
  @spec killmail(killmail_id :: integer, killmail_hash :: String.t, opts :: killmail_opts) :: ESI.Request.t
  def killmail(killmail_id, killmail_hash, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "killmails/#{killmail_id}/#{killmail_hash}",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end