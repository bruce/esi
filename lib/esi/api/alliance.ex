defmodule ESI.API.Alliance do

  @typedoc """
Options for [`Alliance.names/1`](#names/1).

  - `:alliance_ids` (REQUIRED) -- A comma separated list of alliance IDs
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type names_opts :: [
    alliance_ids: [integer],
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Resolve a set of alliance IDs to alliance names.

  ## Response Example

  List of id/name associations:

      [%{"alliance_id" => 1000171, "alliance_name" => "Republic University"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_names`
  - `path` -- `/alliances/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_names)

  """
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/names/",
      opts_schema: %{alliance_ids: {:query, :required}, datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Alliance.corporations/2`](#corporations/2).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type corporations_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  List all current member corporations of an alliance.

  ## Response Example

  List of corporation IDs:

      [98000001]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_corporations`
  - `path` -- `/alliances/{alliance_id}/corporations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_corporations)

  """
  @spec corporations(alliance_id :: integer, opts :: corporations_opts) :: ESI.Request.t
  def corporations(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/corporations/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Alliance.icons/2`](#icons/2).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type icons_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Get the icon urls for a alliance.

  ## Response Example

  Urls for icons for the given alliance id and server:

      %{"px128x128" => "https://imageserver.eveonline.com/Alliance/503818424_128.png",
        "px64x64" => "https://imageserver.eveonline.com/Alliance/503818424_64.png"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_icons`
  - `path` -- `/alliances/{alliance_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_icons)

  """
  @spec icons(alliance_id :: integer, opts :: icons_opts) :: ESI.Request.t
  def icons(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/icons/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Alliance.alliance/2`](#alliance/2).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type alliance_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Public information about an alliance.

  ## Response Example

  Public data about an alliance:

      %{"alliance_name" => "C C P Alliance", "date_founded" => "2016-06-26T21:00:00Z",
        "executor_corp" => 98356193, "ticker" => "<C C P>"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id`
  - `path` -- `/alliances/{alliance_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id)

  """
  @spec alliance(alliance_id :: integer, opts :: alliance_opts) :: ESI.Request.t
  def alliance(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Alliance.alliances/1`](#alliances/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type alliances_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  List all active player alliances.

  ## Response Example

  List of Alliance IDs:

      [99000001, 99000002]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances`
  - `path` -- `/alliances/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances)

  """
  @spec alliances(opts :: alliances_opts) :: ESI.Request.t
  def alliances(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end