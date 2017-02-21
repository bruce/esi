defmodule ESI.API.Universe do

  @doc """
  Returns information on requested structure, if you are on the ACL. Otherwise, returns "Forbidden" for all inputs..

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


  @doc """
  Get a list of bloodlines.

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

  @doc """
  Get information on a planetary factory schematic.

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


  @doc """
  Get information of an item category.

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

  @doc """
  List all public structures.

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


  @doc """
  Get a list of item groups.

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


  @doc """
  Get a list of character races.

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

  @doc """
  Get information on a moon.

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


  @doc """
  Get information on a constellation.

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

  @doc """
  Get a list of item categories.

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


  @doc """
  Get information on a type.

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

  @doc """
  Get a list of solar systems.

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

  @doc """
  Get a list of constellations.

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


  @doc """
  Get information on a solar system.

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


  @doc """
  Get information on an item group.

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


  @doc """
  Get a list of factions.

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

  @doc """
  Get information on a stargate.

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


  @doc """
  Get a list of type ids.

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


  @doc """
  Get information on a region.

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

  @doc """
  Get a list of regions.

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

  @doc """
  Get information on a planet.

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

  @doc """
  Get information on a station.

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


  @doc """
  Resolve a set of IDs to names and categories. Supported ID's for resolving are: Characters, Corporations, Alliances, Stations, Solar Systems, Constellations, Regions, Types..

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