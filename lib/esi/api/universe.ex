defmodule ESI.API.Universe do

  @type structure_result :: [name: String.t, position: nil | [x: float, y: float, z: float], solar_system_id: integer, type_id: nil | integer]


  @doc """
  Returns information on requested structure, if you are on the ACL. Otherwise, returns "Forbidden" for all inputs..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`structure_result`](#t:structure_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_structures_structure_id`
  - `path` -- `/universe/structures/{structure_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_structures_structure_id)

  """
  @spec structure(structure_id :: integer) :: ESI.Request.t
  def structure(structure_id) do
    %ESI.Request{
      verb: :get,
      path: "/universe/structures/#{structure_id}/",

    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type bloodlines_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type bloodlines_result :: [[bloodline_id: integer, charisma: integer, corporation_id: integer, description: String.t, intelligence: integer, memory: integer, name: String.t, perception: integer, race_id: integer, ship_type_id: integer, willpower: integer]]


  @doc """
  Get a list of bloodlines.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`bloodlines_result`](#t:bloodlines_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type schematic_result :: [cycle_time: integer, schematic_name: String.t]


  @doc """
  Get information on a planetary factory schematic.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`schematic_result`](#t:schematic_result/0) type.

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

    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type category_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type category_result :: [category_id: integer, groups: [integer], name: String.t, published: boolean]


  @doc """
  Get information of an item category.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`category_result`](#t:category_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type structures_result :: [integer]


  @doc """
  List all public structures.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`structures_result`](#t:structures_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_universe_structures`
  - `path` -- `/universe/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Universe/get_universe_structures)

  """
  @spec structures() :: ESI.Request.t
  def structures() do
    %ESI.Request{
      verb: :get,
      path: "/universe/structures/",

    }
  end

  @typedoc """
  - `:page` -- Which page to query
  """
  @type groups_opts :: [
    page: nil | integer,
  ]

  @type groups_result :: [integer]


  @doc """
  Get a list of item groups.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`groups_result`](#t:groups_result/0) type.

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
      query_opts: Keyword.take(opts, [:page]),
    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type races_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type races_result :: [[alliance_id: integer, description: String.t, name: String.t, race_id: integer]]


  @doc """
  Get a list of character races.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`races_result`](#t:races_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type moon_result :: [moon_id: integer, name: String.t, position: [x: float, y: float, z: float], system_id: integer]


  @doc """
  Get information on a moon.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`moon_result`](#t:moon_result/0) type.

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

    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type constellation_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type constellation_result :: [constellation_id: integer, name: String.t, position: [x: float, y: float, z: float], region_id: integer, systems: [integer]]


  @doc """
  Get information on a constellation.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`constellation_result`](#t:constellation_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type categories_result :: [integer]


  @doc """
  Get a list of item categories.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`categories_result`](#t:categories_result/0) type.

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

    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type type_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type type_result :: [capacity: nil | float, description: String.t, dogma_attributes: nil | [[attribute_id: integer, value: float]], dogma_effects: nil | [[effect_id: integer, is_default: boolean]], graphic_id: nil | integer, group_id: integer, icon_id: nil | integer, mass: nil | float, name: String.t, portion_size: nil | integer, published: boolean, radius: nil | float, type_id: integer, volume: nil | float]


  @doc """
  Get information on a type.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`type_result`](#t:type_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type systems_result :: [integer]


  @doc """
  Get a list of solar systems.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`systems_result`](#t:systems_result/0) type.

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

    }
  end

  @type constellations_result :: [integer]


  @doc """
  Get a list of constellations.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`constellations_result`](#t:constellations_result/0) type.

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

    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type system_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type system_result :: [constellation_id: integer, name: String.t, planets: [[moons: nil | [integer], planet_id: integer]], position: [x: float, y: float, z: float], security_class: nil | String.t, security_status: float, stargates: [integer], system_id: integer]


  @doc """
  Get information on a solar system.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`system_result`](#t:system_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type group_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type group_result :: [category_id: float, group_id: integer, name: String.t, published: boolean, types: [integer]]


  @doc """
  Get information on an item group.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`group_result`](#t:group_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type factions_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type factions_result :: [[corporation_id: integer, description: String.t, faction_id: integer, is_unique: boolean, militia_corporation_id: nil | integer, name: String.t, size_factor: float, solar_system_id: integer, station_count: integer, station_system_count: integer]]


  @doc """
  Get a list of factions.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`factions_result`](#t:factions_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type stargate_result :: [destination: [stargate_id: integer, system_id: integer], name: String.t, position: [x: float, y: float, z: float], stargate_id: integer, system_id: integer, type_id: integer]


  @doc """
  Get information on a stargate.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`stargate_result`](#t:stargate_result/0) type.

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

    }
  end

  @typedoc """
  - `:page` -- Which page to query
  """
  @type types_opts :: [
    page: nil | integer,
  ]

  @type types_result :: [integer]


  @doc """
  Get a list of type ids.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`types_result`](#t:types_result/0) type.

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
      query_opts: Keyword.take(opts, [:page]),
    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type region_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type region_result :: [constellations: [integer], description: nil | String.t, name: String.t, region_id: integer]


  @doc """
  Get information on a region.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`region_result`](#t:region_result/0) type.

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
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type regions_result :: [integer]


  @doc """
  Get a list of regions.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`regions_result`](#t:regions_result/0) type.

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

    }
  end

  @type planet_result :: [name: String.t, planet_id: integer, position: [x: float, y: float, z: float], system_id: integer, type_id: integer]


  @doc """
  Get information on a planet.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`planet_result`](#t:planet_result/0) type.

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

    }
  end

  @type station_result :: [max_dockable_ship_volume: float, name: String.t, office_rental_cost: float, owner: nil | integer, position: [x: float, y: float, z: float], race_id: nil | integer, reprocessing_efficiency: float, reprocessing_stations_take: float, services: [:"bounty-missions" | :"assasination-missions" | :"courier-missions" | :interbus | :"reprocessing-plant" | :refinery | :market | :"black-market" | :"stock-exchange" | :cloning | :surgery | :"dna-therapy" | :"repair-facilities" | :factory | :labratory | :gambling | :fitting | :paintshop | :news | :storage | :insurance | :docking | :"office-rental" | :"jump-clone-facility" | :"loyalty-point-store" | :"navy-offices" | :"security-offices"], station_id: integer, system_id: integer, type_id: integer]


  @doc """
  Get information on a station.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`station_result`](#t:station_result/0) type.

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

    }
  end

  @typedoc """
  - `:ids` (REQUIRED) -- The ids to resolve
  """
  @type create_names_opts :: [
    ids: [nil | integer],
  ]

  @type create_names_result :: [[category: :alliance | :character | :constellation | :corporation | :inventory_type | :region | :solar_system | :station, id: integer, name: String.t]]


  @doc """
  Resolve a set of IDs to names and categories. Supported ID's for resolving are: Characters, Corporations, Alliances, Stations, Solar Systems, Constellations, Regions, Types..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_names_result`](#t:create_names_result/0) type.

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
      body_opts: Keyword.take(opts, [:ids]),
    }
  end
end