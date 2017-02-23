defmodule ESI.API.Killmail do

  @type killmail_result :: [attackers: [[alliance_id: nil | integer, character_id: nil | integer, corporation_id: nil | integer, damage_done: integer, faction_id: nil | integer, final_blow: boolean, security_status: float, ship_type_id: nil | integer, weapon_type_id: nil | integer]], killmail_id: integer, killmail_time: String.t, moon_id: nil | integer, solar_system_id: integer, victim: [alliance_id: nil | integer, character_id: nil | integer, corporation_id: nil | integer, damage_taken: integer, faction_id: nil | integer, items: nil | [[flag: integer, item_type_id: integer, items: nil | [[flag: integer, item_type_id: integer, quantity_destroyed: nil | integer, quantity_dropped: nil | integer, singleton: integer]], quantity_destroyed: nil | integer, quantity_dropped: nil | integer, singleton: integer]], position: nil | [x: float, y: float, z: float], ship_type_id: integer], war_id: nil | integer]


  @doc """
  Return a single killmail from its ID and hash.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`killmail_result`](#t:killmail_result/0) type.

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