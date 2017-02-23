defmodule ESI.API.Sovereignty do

  @type campaigns_result :: [[attackers_score: nil | float, campaign_id: integer, constellation_id: integer, defender_id: nil | integer, defender_score: nil | float, event_type: :tcu_defense | :ihub_defense | :station_defense | :station_freeport, participants: nil | [[alliance_id: integer, score: float]], solar_system_id: integer, start_time: String.t, structure_id: integer]]


  @doc """
  Shows sovereignty data for campaigns..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`campaigns_result`](#t:campaigns_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_campaigns`
  - `path` -- `/sovereignty/campaigns/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_campaigns)

  """
  @spec campaigns() :: ESI.Request.t
  def campaigns() do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/campaigns/",

    }
  end

  @type structures_result :: [[alliance_id: integer, solar_system_id: integer, structure_id: integer, structure_type_id: integer, vulnerability_occupancy_level: nil | float, vulnerable_end_time: nil | String.t, vulnerable_start_time: nil | String.t]]


  @doc """
  Shows sovereignty data for structures..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`structures_result`](#t:structures_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_structures`
  - `path` -- `/sovereignty/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_structures)

  """
  @spec structures() :: ESI.Request.t
  def structures() do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/structures/",

    }
  end
end