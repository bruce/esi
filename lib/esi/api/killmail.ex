defmodule ESI.API.Killmail do

  @doc """
  Return a single killmail from its ID and hash.

  ## Response Example

  A killmail:

      %{"attackers" => [%{"character_id" => 95810944, "corporation_id" => 1000179,
           "damage_done" => 5745, "faction_id" => 500003, "final_blow" => true,
           "security_status" => -0.3, "ship_type_id" => 17841,
           "weapon_type_id" => 3074}], "killmail_id" => 56733821,
        "killmail_time" => "2016-10-22T17:13:36Z", "solar_system_id" => 30002976,
        "victim" => %{"alliance_id" => 621338554, "character_id" => 92796241,
          "corporation_id" => 841363671, "damage_taken" => 5745,
          "items" => [%{"flag" => 20, "item_type_id" => 5973, "quantity_dropped" => 1,
             "singleton" => 0}],
          "position" => %{"x" => 452186600569.4748, "y" => 146704961490.90222,
            "z" => 109514596532.54477}, "ship_type_id" => 17812}}

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