defmodule ESI.API.Sovereignty do

  @typedoc """
Options for [`Sovereignty.campaigns/1`](#campaigns/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type campaigns_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Shows sovereignty data for campaigns..

  ## Response Example

  A list of sovereignty campaigns:

      [%{"attackers_score" => 0.4, "campaign_id" => 32833,
         "constellation_id" => 20000125, "defender_id" => 1695357456,
         "defender_score" => 0.6, "event_type" => "station_defense",
         "solar_system_id" => 30000856, "start_time" => "2016-10-29T14:34:40Z",
         "structure_id" => 61001096}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_campaigns`
  - `path` -- `/sovereignty/campaigns/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_campaigns)

  """
  @spec campaigns(opts :: campaigns_opts) :: ESI.Request.t
  def campaigns(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/campaigns/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Sovereignty.structures/1`](#structures/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structures_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Shows sovereignty data for structures..

  ## Response Example

  A list of sovereignty structures:

      [%{"alliance_id" => 498125261, "solar_system_id" => 30000570,
         "structure_id" => 1018253388776, "structure_type_id" => 32226,
         "vulnerability_occupancy_level" => 2,
         "vulnerable_end_time" => "2016-10-29T05:30:00Z",
         "vulnerable_start_time" => "2016-10-28T20:30:00Z"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_structures`
  - `path` -- `/sovereignty/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_structures)

  """
  @spec structures(opts :: structures_opts) :: ESI.Request.t
  def structures(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/structures/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end