defmodule ESI.API.Universe do

  @doc """
  Returns information on requested structure, if you are on the ACL. Otherwise, returns "Forbidden" for all inputs.

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_structures_structure_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structure_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec structure(structure_id :: integer, opts :: structure_opts) :: ESI.Request.t
  def structure(structure_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/structures/#{structure_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Get a list of bloodlines

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_bloodlines`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type bloodlines_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec bloodlines(opts :: bloodlines_opts) :: ESI.Request.t
  def bloodlines(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/bloodlines/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get information on a planetary factory schematic

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_schematics_schematic_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type schematic_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec schematic(schematic_id :: integer, opts :: schematic_opts) :: ESI.Request.t
  def schematic(schematic_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/schematics/#{schematic_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get information of an item category

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_categories_category_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type category_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec category(category_id :: integer, opts :: category_opts) :: ESI.Request.t
  def category(category_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/categories/#{category_id}/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  List all public structures

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_structures`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structures_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec structures(opts :: structures_opts) :: ESI.Request.t
  def structures(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/structures/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get a list of item groups

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_groups`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:page` -- Which page to query
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type groups_opts :: [
    datasource: nil | :tranquility | :singularity,
    page: nil | integer,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec groups(opts :: groups_opts) :: ESI.Request.t
  def groups(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/groups/",
      query_opts: Keyword.take(opts, [:datasource, :page, :user_agent]),
    }
  end

  @doc """
  Get a list of character races

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_races`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type races_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec races(opts :: races_opts) :: ESI.Request.t
  def races(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/races/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get information on a moon

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_moons_moon_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type moon_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec moon(moon_id :: integer, opts :: moon_opts) :: ESI.Request.t
  def moon(moon_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/moons/#{moon_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get information on a constellation

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_constellations_constellation_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type constellation_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec constellation(constellation_id :: integer, opts :: constellation_opts) :: ESI.Request.t
  def constellation(constellation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/constellations/#{constellation_id}/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get a list of item categories

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_categories`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type categories_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec categories(opts :: categories_opts) :: ESI.Request.t
  def categories(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/categories/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get information on a type

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_types_type_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type type_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec type(type_id :: integer, opts :: type_opts) :: ESI.Request.t
  def type(type_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/types/#{type_id}/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get a list of solar systems

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_systems`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type systems_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec systems(opts :: systems_opts) :: ESI.Request.t
  def systems(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/systems/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get a list of constellations

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_constellations`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type constellations_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec constellations(opts :: constellations_opts) :: ESI.Request.t
  def constellations(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/constellations/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get information on a solar system

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_systems_system_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type system_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec system(system_id :: integer, opts :: system_opts) :: ESI.Request.t
  def system(system_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/systems/#{system_id}/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get information on an item group

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_groups_group_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type group_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec group(group_id :: integer, opts :: group_opts) :: ESI.Request.t
  def group(group_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/groups/#{group_id}/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get a list of factions

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_factions`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type factions_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec factions(opts :: factions_opts) :: ESI.Request.t
  def factions(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/factions/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get information on a stargate

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_stargates_stargate_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type stargate_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec stargate(stargate_id :: integer, opts :: stargate_opts) :: ESI.Request.t
  def stargate(stargate_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/stargates/#{stargate_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get a list of type ids

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_types`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:page` -- Which page to query
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type types_opts :: [
    datasource: nil | :tranquility | :singularity,
    page: nil | integer,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec types(opts :: types_opts) :: ESI.Request.t
  def types(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/types/",
      query_opts: Keyword.take(opts, [:datasource, :page, :user_agent]),
    }
  end

  @doc """
  Get information on a region

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_regions_region_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type region_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec region(region_id :: integer, opts :: region_opts) :: ESI.Request.t
  def region(region_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/regions/#{region_id}/",
      query_opts: Keyword.take(opts, [:datasource, :language, :user_agent]),
    }
  end

  @doc """
  Get a list of regions

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_regions`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type regions_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec regions(opts :: regions_opts) :: ESI.Request.t
  def regions(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/regions/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get information on a planet

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_planets_planet_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type planet_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec planet(planet_id :: integer, opts :: planet_opts) :: ESI.Request.t
  def planet(planet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/planets/#{planet_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get information on a station

  ## Swagger

  The Swagger Operation ID for this function is `get_universe_stations_station_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type station_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg, :word]
  @spec station(station_id :: integer, opts :: station_opts) :: ESI.Request.t
  def station(station_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/universe/stations/#{station_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Resolve a set of IDs to names and categories. Supported ID's for resolving are: Characters, Corporations, Alliances, Stations, Solar Systems, Constellations, Regions, Types.

  ## Swagger

  The Swagger Operation ID for this function is `post_universe_names`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:ids` (REQUIRED) -- The ids to resolve
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_name_opts :: [
    datasource: nil | :tranquility | :singularity,
    ids: [nil | integer],
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec create_name(opts :: create_name_opts) :: ESI.Request.t
  def create_name(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/universe/names/",
      body_opts: Keyword.take(opts, [:ids]),
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end