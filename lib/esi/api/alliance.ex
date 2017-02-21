defmodule ESI.API.Alliance do

  @typedoc """
  - `:alliance_ids` (REQUIRED) -- A comma separated list of alliance IDs
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type names_opts :: [
    alliance_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Resolve a set of alliance IDs to alliance names

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_names`
  - `path` -- `/alliances/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_names)

  """
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "alliances/names",
      query_opts: Keyword.take(opts, [:alliance_ids, :datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type corporations_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  List all current member corporations of an alliance

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_corporations`
  - `path` -- `/alliances/{alliance_id}/corporations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_corporations)

  """
  @spec corporations(alliance_id :: integer, opts :: corporations_opts) :: ESI.Request.t
  def corporations(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "alliances/#{alliance_id}/corporations",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type icons_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Get the icon urls for a alliance

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_icons`
  - `path` -- `/alliances/{alliance_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_icons)

  """
  @spec icons(alliance_id :: integer, opts :: icons_opts) :: ESI.Request.t
  def icons(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "alliances/#{alliance_id}/icons",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type alliance_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Public information about an alliance

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id`
  - `path` -- `/alliances/{alliance_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id)

  """
  @spec alliance(alliance_id :: integer, opts :: alliance_opts) :: ESI.Request.t
  def alliance(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "alliances/#{alliance_id}",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type alliances_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  List all active player alliances

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances`
  - `path` -- `/alliances/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances)

  """
  @spec alliances(opts :: alliances_opts) :: ESI.Request.t
  def alliances(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "alliances",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end