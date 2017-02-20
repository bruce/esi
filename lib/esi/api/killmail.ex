defmodule ESI.API.Killmail do

  @doc """
  Return a single killmail from its ID and hash

  ## Swagger

  The Swagger Operation ID for this function is `get_killmails_killmail_id_killmail_hash`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type get_killmails_killmail_id_killmail_hash_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg, :arg]
  @spec get_killmails_killmail_id_killmail_hash(killmail_id :: integer, killmail_hash :: String.t, opts :: get_killmails_killmail_id_killmail_hash_opts) :: ESI.Request.t
  def get_killmails_killmail_id_killmail_hash(killmail_id, killmail_hash, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/killmails/#{killmail_id}/#{killmail_hash}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end