defmodule ESI.API.FactionWarfare do

  @doc """
  Top 100 leaderboard of pilots for kills and victory points separated by total, last week and yesterday..

  ## Response Example

  Character leaderboard of kills and victory points within faction warfare.:

      %{"kills" => %{"active_total" => [%{"amount" => 10000,
             "character_id" => 2112625428},
           %{"amount" => 8500, "character_id" => 95465499}],
          "last_week" => [%{"amount" => 100, "character_id" => 2112625428},
           %{"amount" => 70, "character_id" => 95465499}],
          "yesterday" => [%{"amount" => 34, "character_id" => 2112625428},
           %{"amount" => 20, "character_id" => 95465499}]},
        "victory_points" => %{"active_total" => [%{"amount" => 1239158,
             "character_id" => 2112625428},
           %{"amount" => 1139029, "character_id" => 95465499}],
          "last_week" => [%{"amount" => 2660, "character_id" => 2112625428},
           %{"amount" => 2000, "character_id" => 95465499}],
          "yesterday" => [%{"amount" => 620, "character_id" => 2112625428},
           %{"amount" => 550, "character_id" => 95465499}]}}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fw_leaderboards_characters`
  - `path` -- `/fw/leaderboards/characters/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_fw_leaderboards_characters)

  """
  @spec leaderboards_characters() :: ESI.Request.t
  def leaderboards_characters() do
    %ESI.Request{
      verb: :get,
      path: "/fw/leaderboards/characters/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Data about which NPC factions are at war.

  ## Response Example

  A list of NPC factions at war:

      [%{"against_id" => 500002, "faction_id" => 500001}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fw_wars`
  - `path` -- `/fw/wars/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_fw_wars)

  """
  @spec wars() :: ESI.Request.t
  def wars() do
    %ESI.Request{
      verb: :get,
      path: "/fw/wars/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Statistical overviews of factions involved in faction warfare.

  ## Response Example

  Per faction breakdown of faction warfare statistics:

      [%{"faction_id" => 500001,
         "kills" => %{"last_week" => 893, "total" => 684350, "yesterday" => 136},
         "pilots" => 28863, "systems_controlled" => 20,
         "victory_points" => %{"last_week" => 102640, "total" => 52658260,
           "yesterday" => 15980}}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fw_stats`
  - `path` -- `/fw/stats/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_fw_stats)

  """
  @spec stats() :: ESI.Request.t
  def stats() do
    %ESI.Request{
      verb: :get,
      path: "/fw/stats/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Top 10 leaderboard of corporations for kills and victory points separated by total, last week and yesterday..

  ## Response Example

  Corporation leaderboard of kills and victory points within faction warfare.:

      %{"kills" => %{"active_total" => [%{"amount" => 81692,
             "corporation_id" => 1000180},
           %{"amount" => 76793, "corporation_id" => 1000182}],
          "last_week" => [%{"amount" => 290, "corporation_id" => 1000180},
           %{"amount" => 169, "corporation_id" => 1000182}],
          "yesterday" => [%{"amount" => 51, "corporation_id" => 1000180},
           %{"amount" => 39, "corporation_id" => 1000182}]},
        "victory_points" => %{"active_total" => [%{"amount" => 18640927,
             "corporation_id" => 1000180},
           %{"amount" => 18078265, "corporation_id" => 1000181}],
          "last_week" => [%{"amount" => 91980, "corporation_id" => 1000180},
           %{"amount" => 58920, "corporation_id" => 1000181}],
          "yesterday" => [%{"amount" => 12600, "corporation_id" => 1000180},
           %{"amount" => 8240, "corporation_id" => 1000181}]}}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fw_leaderboards_corporations`
  - `path` -- `/fw/leaderboards/corporations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_fw_leaderboards_corporations)

  """
  @spec leaderboards_corporations() :: ESI.Request.t
  def leaderboards_corporations() do
    %ESI.Request{
      verb: :get,
      path: "/fw/leaderboards/corporations/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Top 4 leaderboard of factions for kills and victory points separated by total, last week and yesterday..

  ## Response Example

  Corporation leaderboard of kills and victory points within faction warfare.:

      %{"kills" => %{"active_total" => [%{"amount" => 832273, "faction_id" => 500004},
           %{"amount" => 687915, "faction_id" => 500001}],
          "last_week" => [%{"amount" => 730, "faction_id" => 500001},
           %{"amount" => 671, "faction_id" => 500004}],
          "yesterday" => [%{"amount" => 100, "faction_id" => 500001},
           %{"amount" => 50, "faction_id" => 500004}]},
        "victory_points" => %{"active_total" => [%{"amount" => 53130500,
             "faction_id" => 500001},
           %{"amount" => 50964263, "faction_id" => 500004}],
          "last_week" => [%{"amount" => 97360, "faction_id" => 500001},
           %{"amount" => 84980, "faction_id" => 500004}],
          "yesterday" => [%{"amount" => 5000, "faction_id" => 500002},
           %{"amount" => 3500, "faction_id" => 500003}]}}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fw_leaderboards`
  - `path` -- `/fw/leaderboards/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_fw_leaderboards)

  """
  @spec leaderboards() :: ESI.Request.t
  def leaderboards() do
    %ESI.Request{
      verb: :get,
      path: "/fw/leaderboards/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  An overview of the current ownership of faction warfare solar systems.

  ## Response Example

  All faction war solar systems:

      [%{"contested" => true, "occupier_faction_id" => 500001,
         "owner_faction_id" => 500001, "solar_system_id" => 30002096,
         "victory_points" => 60, "victory_points_threshold" => 3000}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fw_systems`
  - `path` -- `/fw/systems/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_fw_systems)

  """
  @spec systems() :: ESI.Request.t
  def systems() do
    %ESI.Request{
      verb: :get,
      path: "/fw/systems/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end
end