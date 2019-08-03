defmodule ESI.API.Universe do

  @typedoc """
  Options for [`Universe.create_names/1`](#create_names/1).

  - `:ids` (REQUIRED) -- The ids to resolve
  """
  @type create_names_opts :: [create_names_opt]
  @type create_names_opt :: {:ids, [nil | integer]}


  @doc """
  Resolve a set of IDs to names and categories. Supported ID's for resolving are: Characters, Corporations, Alliances, Stations, Solar Systems, Constellations, Regions, Types, Factions.

  ## Response Example

  List of id/name associations for a set of IDs. All IDs must resolve to a name, or nothing will be returned:

      [
        %{"category" => "character", "id" => 95465499, "name" => "CCP Bartender"},
        %{"category" => "solar_system", "id" => 30000142, "name" => "Jita"}
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_universe_names`
  - `path` -- `/universe/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/post_universe_names)

  """
  @spec create_names(opts :: create_names_opts) :: ESI.Request.t
  def create_names(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/universe/names/",
      opts_schema: %{datasource: {:query, :optional}, ids: {:body, :required}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a station.

  ## Response Example

  Information about a station:

      %{
        "max_dockable_ship_volume" => 50000000,
        "name" => "Jakanerva III - Moon 15 - Prompt Delivery Storage",
        "office_rental_cost" => 10000,
        "owner" => 1000003,
        "position" => %{"x" => 165632286720, "y" => 2771804160, "z" => -2455331266560},
        "race_id" => 1,
        "reprocessing_efficiency" => 0.5,
        "reprocessing_stations_take" => 0.05,
        "services" => ["courier-missions", "reprocessing-plant", "market",
         "repair-facilities", "fitting", "news", "storage", "insurance", "docking",
         "office-rental", "loyalty-point-store", "navy-offices"],
        "station_id" => 60000277,
        "system_id" => 30000148,
        "type_id" => 1531
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_stations_station_id`
  - `path` -- `/universe/stations/{station_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_stations_station_id)

  """
  @spec station(station_id :: integer) :: ESI.Request.t
  def station(station_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/stations/#{station_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.ancestries/1`](#ancestries/1).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type ancestries_opts :: [ancestries_opt]
  @type ancestries_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get all character ancestries.

  ## Response Example

  A list of ancestries:

      [
        %{
          "bloodline_id" => 1,
          "description" => "Acutely aware of the small population...",
          "id" => 12,
          "name" => "Tube Child",
          "short_description" => "Manufactured citizens of the State."
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_ancestries`
  - `path` -- `/universe/ancestries/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_ancestries)

  """
  @spec ancestries(opts :: ancestries_opts) :: ESI.Request.t
  def ancestries(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/ancestries/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a planet.

  ## Response Example

  Information about a planet:

      %{
        "name" => "Akpivem III",
        "planet_id" => 40000046,
        "position" => %{"x" => -189226344497, "y" => 9901605317, "z" => -254852632979},
        "system_id" => 30000003,
        "type_id" => 13
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_planets_planet_id`
  - `path` -- `/universe/planets/{planet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_planets_planet_id)

  """
  @spec planet(planet_id :: integer) :: ESI.Request.t
  def planet(planet_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/planets/#{planet_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get a list of regions.

  ## Response Example

  A list of region ids:

      [11000001, 11000002]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_regions`
  - `path` -- `/universe/regions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_regions)

  """
  @spec regions() :: ESI.Request.t
  def regions() do
    %ESI.Request{
      verb: :get,
      path: "/universe/regions/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.region/2`](#region/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type region_opts :: [region_opt]
  @type region_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get information on a region.

  ## Response Example

  Information about a region:

      %{
        "constellations" => [20000302, 20000303],
        "description" => "It has long been an established fact of civilization...",
        "name" => "Metropolis",
        "region_id" => 10000042
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_regions_region_id`
  - `path` -- `/universe/regions/{region_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_regions_region_id)

  """
  @spec region(region_id :: integer, opts :: region_opts) :: ESI.Request.t
  def region(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/regions/#{region_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get a list of graphics.

  ## Response Example

  A list of graphic ids:

      [10, 4106]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_graphics`
  - `path` -- `/universe/graphics/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_graphics)

  """
  @spec graphics() :: ESI.Request.t
  def graphics() do
    %ESI.Request{
      verb: :get,
      path: "/universe/graphics/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get information on an asteroid belt.

  ## Response Example

  Information about an asteroid belt:

      %{
        "name" => "Tanoo I - Asteroid Belt 1",
        "position" => %{"x" => 161967513600, "y" => 21288837120, "z" => -73505464320},
        "system_id" => 30000001
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_asteroid_belts_asteroid_belt_id`
  - `path` -- `/universe/asteroid_belts/{asteroid_belt_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_asteroid_belts_asteroid_belt_id)

  """
  @spec asteroid_belt(asteroid_belt_id :: integer) :: ESI.Request.t
  def asteroid_belt(asteroid_belt_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/asteroid_belts/#{asteroid_belt_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get the number of ship, pod and NPC kills per solar system within the last hour ending at the timestamp of the Last-Modified header, excluding wormhole space. Only systems with kills will be listed.

  ## Response Example

  A list of systems and number of ship, pod and NPC kills:

      [
        %{
          "npc_kills" => 0,
          "pod_kills" => 24,
          "ship_kills" => 42,
          "system_id" => 30002410
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_system_kills`
  - `path` -- `/universe/system_kills/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_system_kills)

  """
  @spec system_kills() :: ESI.Request.t
  def system_kills() do
    %ESI.Request{
      verb: :get,
      path: "/universe/system_kills/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.types/1`](#types/1).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type types_opts :: [types_opt]
  @type types_opt :: {:page, nil | integer}


  @doc """
  Get a list of type ids.

  ## Response Example

  A list of type ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_types`
  - `path` -- `/universe/types/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_types)

  """
  @spec types(opts :: types_opts) :: ESI.Request.t
  def types(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/types/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a stargate.

  ## Response Example

  Information about a stargate:

      %{
        "destination" => %{"stargate_id" => 50000056, "system_id" => 30000001},
        "name" => "Stargate (Tanoo)",
        "position" => %{"x" => -101092761600, "y" => 5279539200, "z" => 1550503403520},
        "stargate_id" => 50000342,
        "system_id" => 30000003,
        "type_id" => 29624
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_stargates_stargate_id`
  - `path` -- `/universe/stargates/{stargate_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_stargates_stargate_id)

  """
  @spec stargate(stargate_id :: integer) :: ESI.Request.t
  def stargate(stargate_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/stargates/#{stargate_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.factions/1`](#factions/1).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type factions_opts :: [factions_opt]
  @type factions_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get a list of factions.

  ## Response Example

  A list of factions:

      [
        %{
          "corporation_id" => 456,
          "description" => "blah blah",
          "faction_id" => 1,
          "is_unique" => true,
          "name" => "Faction",
          "size_factor" => 1.0,
          "solar_system_id" => 123,
          "station_count" => 1000,
          "station_system_count" => 100
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_factions`
  - `path` -- `/universe/factions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_factions)

  """
  @spec factions(opts :: factions_opts) :: ESI.Request.t
  def factions(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/factions/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Universe.group/2`](#group/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type group_opts :: [group_opt]
  @type group_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get information on an item group.

  ## Response Example

  Information about an item group:

      %{
        "category_id" => 6,
        "group_id" => 25,
        "name" => "Frigate",
        "published" => true,
        "types" => [587, 586, 585]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_groups_group_id`
  - `path` -- `/universe/groups/{group_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_groups_group_id)

  """
  @spec group(group_id :: integer, opts :: group_opts) :: ESI.Request.t
  def group(group_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/groups/#{group_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Universe.system/2`](#system/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type system_opts :: [system_opt]
  @type system_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get information on a solar system..

  ## Response Example

  Information about a solar system:

      %{
        "constellation_id" => 20000001,
        "name" => "Akpivem",
        "planets" => [
          %{"moons" => [40000042], "planet_id" => 40000041},
          %{"planet_id" => 40000043}
        ],
        "position" => %{
          "x" => -91174141133075340,
          "y" => 43938227486247170,
          "z" => -56482824383339900
        },
        "security_class" => "B",
        "security_status" => 0.8462923765182495,
        "star_id" => 40000040,
        "stargates" => [50000342],
        "system_id" => 30000003
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_systems_system_id`
  - `path` -- `/universe/systems/{system_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_systems_system_id)

  """
  @spec system(system_id :: integer, opts :: system_opts) :: ESI.Request.t
  def system(system_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/systems/#{system_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get a list of constellations.

  ## Response Example

  A list of constellation ids:

      [20000001, 20000002]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_constellations`
  - `path` -- `/universe/constellations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_constellations)

  """
  @spec constellations() :: ESI.Request.t
  def constellations() do
    %ESI.Request{
      verb: :get,
      path: "/universe/constellations/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get a list of solar systems.

  ## Response Example

  A list of solar system ids:

      [30000001, 30000002]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_systems`
  - `path` -- `/universe/systems/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_systems)

  """
  @spec systems() :: ESI.Request.t
  def systems() do
    %ESI.Request{
      verb: :get,
      path: "/universe/systems/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.type/2`](#type/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type type_opts :: [type_opt]
  @type type_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get information on a type.

  ## Response Example

  Information about a type:

      %{
        "description" => "The Rifter is a...",
        "group_id" => 25,
        "name" => "Rifter",
        "published" => true,
        "type_id" => 587
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_types_type_id`
  - `path` -- `/universe/types/{type_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_types_type_id)

  """
  @spec type(type_id :: integer, opts :: type_opts) :: ESI.Request.t
  def type(type_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/types/#{type_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get a list of item categories.

  ## Response Example

  A list of item category ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_categories`
  - `path` -- `/universe/categories/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_categories)

  """
  @spec categories() :: ESI.Request.t
  def categories() do
    %ESI.Request{
      verb: :get,
      path: "/universe/categories/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @doc """
  Get the number of jumps in solar systems within the last hour ending at the timestamp of the Last-Modified header, excluding wormhole space. Only systems with jumps will be listed.

  ## Response Example

  A list of systems and number of jumps:

      [%{"ship_jumps" => 42, "system_id" => 30002410}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_system_jumps`
  - `path` -- `/universe/system_jumps/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_system_jumps)

  """
  @spec system_jumps() :: ESI.Request.t
  def system_jumps() do
    %ESI.Request{
      verb: :get,
      path: "/universe/system_jumps/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.constellation/2`](#constellation/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type constellation_opts :: [constellation_opt]
  @type constellation_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get information on a constellation.

  ## Response Example

  Information about a constellation:

      %{
        "constellation_id" => 20000009,
        "name" => "Mekashtad",
        "position" => %{
          "x" => 67796138757472320,
          "y" => -70591121348560960,
          "z" => -59587016159270070
        },
        "region_id" => 10000001,
        "systems" => [20000302, 20000303]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_constellations_constellation_id`
  - `path` -- `/universe/constellations/{constellation_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_constellations_constellation_id)

  """
  @spec constellation(constellation_id :: integer, opts :: constellation_opts) :: ESI.Request.t
  def constellation(constellation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/constellations/#{constellation_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a moon.

  ## Response Example

  Information about a moon:

      %{
        "moon_id" => 40000042,
        "name" => "Akpivem I - Moon 1",
        "position" => %{"x" => 58605102008, "y" => -3066616285, "z" => -55193617920},
        "system_id" => 30000003
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_moons_moon_id`
  - `path` -- `/universe/moons/{moon_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_moons_moon_id)

  """
  @spec moon(moon_id :: integer) :: ESI.Request.t
  def moon(moon_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/moons/#{moon_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.races/1`](#races/1).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type races_opts :: [races_opt]
  @type races_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get a list of character races.

  ## Response Example

  A list of character races:

      [
        %{
          "alliance_id" => 500001,
          "description" => "Founded on the tenets of patriotism and hard work...",
          "name" => "Caldari",
          "race_id" => 1
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_races`
  - `path` -- `/universe/races/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_races)

  """
  @spec races(opts :: races_opts) :: ESI.Request.t
  def races(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/races/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a star.

  ## Response Example

  Information about a star:

      %{
        "age" => 9398686722,
        "luminosity" => 0.06615000218153,
        "name" => "BKG-Q2 - Star",
        "radius" => 346600000,
        "solar_system_id" => 30004333,
        "spectral_class" => "K2 V",
        "temperature" => 3953,
        "type_id" => 45033
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_stars_star_id`
  - `path` -- `/universe/stars/{star_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_stars_star_id)

  """
  @spec star(star_id :: integer) :: ESI.Request.t
  def star(star_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/stars/#{star_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.groups/1`](#groups/1).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type groups_opts :: [groups_opt]
  @type groups_opt :: {:page, nil | integer}


  @doc """
  Get a list of item groups.

  ## Response Example

  A list of item group ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_groups`
  - `path` -- `/universe/groups/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_groups)

  """
  @spec groups(opts :: groups_opts) :: ESI.Request.t
  def groups(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/groups/",
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a graphic.

  ## Response Example

  Information about a graphic:

      %{
        "graphic_file" => "res:/dx9/model/worldobject/planet/moon.red",
        "graphic_id" => 10
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_graphics_graphic_id`
  - `path` -- `/universe/graphics/{graphic_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_graphics_graphic_id)

  """
  @spec graphic(graphic_id :: integer) :: ESI.Request.t
  def graphic(graphic_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/graphics/#{graphic_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.structures/1`](#structures/1).

  - `:filter` -- Only list public structures that have this service online
  """
  @type structures_opts :: [structures_opt]
  @type structures_opt :: {:filter, nil | :market | :manufacturing_basic}


  @doc """
  List all public structures.

  ## Response Example

  List of public structure IDs:

      [1020988381992, 1020988381991]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_structures`
  - `path` -- `/universe/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_structures)

  """
  @spec structures(opts :: structures_opts) :: ESI.Request.t
  def structures(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/structures/",
      opts_schema: %{datasource: {:query, :optional}, filter: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Universe.create_ids/1`](#create_ids/1).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  - `:names` (REQUIRED) -- The names to resolve
  """
  @type create_ids_opts :: [create_ids_opt]
  @type create_ids_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh} | {:names, [nil | String.t]}


  @doc """
  Resolve a set of names to IDs in the following categories: agents, alliances, characters, constellations, corporations factions, inventory_types, regions, stations, and systems. Only exact matches will be returned. All names searched for are cached for 12 hours.

  ## Response Example

  List of id/name associations for a set of names divided by category. Any name passed in that did not have a match will be ommitted:

      %{
        "characters" => [
          %{"id" => 95465499, "name" => "CCP Bartender"},
          %{"id" => 2112625428, "name" => "CCP Zoetrope"}
        ],
        "systems" => [%{"id" => 30000142, "name" => "Jita"}]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_universe_ids`
  - `path` -- `/universe/ids/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/post_universe_ids)

  """
  @spec create_ids(opts :: create_ids_opts) :: ESI.Request.t
  def create_ids(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/universe/ids/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}, names: {:body, :required}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Universe.category/2`](#category/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type category_opts :: [category_opt]
  @type category_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get information of an item category.

  ## Response Example

  Information about an item category:

      %{
        "category_id" => 6,
        "groups" => [25, 26, 27],
        "name" => "Ship",
        "published" => true
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_categories_category_id`
  - `path` -- `/universe/categories/{category_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_categories_category_id)

  """
  @spec category(category_id :: integer, opts :: category_opts) :: ESI.Request.t
  def category(category_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/categories/#{category_id}/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get information on a planetary factory schematic.

  ## Response Example

  Public data about a schematic:

      %{"cycle_time" => 1800, "schematic_name" => "Bacteria"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_schematics_schematic_id`
  - `path` -- `/universe/schematics/{schematic_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_universe_schematics_schematic_id)

  """
  @spec schematic(schematic_id :: integer) :: ESI.Request.t
  def schematic(schematic_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/schematics/#{schematic_id}/",
      opts_schema: %{datasource: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Universe.bloodlines/1`](#bloodlines/1).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  """
  @type bloodlines_opts :: [bloodlines_opt]
  @type bloodlines_opt :: {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}


  @doc """
  Get a list of bloodlines.

  ## Response Example

  A list of bloodlines:

      [
        %{
          "bloodline_id" => 1,
          "charisma" => 6,
          "corporation_id" => 1000006,
          "description" => "The Deteis are regarded as ...",
          "intelligence" => 7,
          "memory" => 7,
          "name" => "Deteis",
          "perception" => 5,
          "race_id" => 1,
          "ship_type_id" => 601,
          "willpower" => 5
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_bloodlines`
  - `path` -- `/universe/bloodlines/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_bloodlines)

  """
  @spec bloodlines(opts :: bloodlines_opts) :: ESI.Request.t
  def bloodlines(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/bloodlines/",
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Universe.structure/2`](#structure/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type structure_opts :: [structure_opt]
  @type structure_opt :: {:token, nil | String.t}


  @doc """
  Returns information on requested structure if you are on the ACL. Otherwise, returns "Forbidden" for all inputs..

  ## Response Example

  Data about a structure:

      %{
        "name" => "V-3YG7 VI - The Capital",
        "owner_id" => 109299958,
        "solar_system_id" => 30000142
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_structures_structure_id`
  - `path` -- `/universe/structures/{structure_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_structures_structure_id)

  """
  @spec structure(structure_id :: integer, opts :: structure_opts) :: ESI.Request.t
  def structure(structure_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/structures/#{structure_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end