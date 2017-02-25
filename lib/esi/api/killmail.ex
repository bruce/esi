defmodule ESI.API.Killmail do

  @doc """
  Return a single killmail from its ID and hash.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_killmails_killmail_id_killmail_hash`
  - `path` -- `/killmails/{killmail_id}/{killmail_hash}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Killmails/get_killmails_killmail_id_killmail_hash)

  """
  @spec killmail(killmail_id :: integer, killmail_hash :: String.t) :: ESI.Request.t
  def killmail(killmail_id, killmail_hash) do
    %ESI.Request{
      verb: :get,
      path: "/killmails/#{killmail_id}/#{killmail_hash}/",

    }
  end
end