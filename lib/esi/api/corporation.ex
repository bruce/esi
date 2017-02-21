defmodule ESI.API.Corporation do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type alliance_history_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Get a list of all the alliances a corporation has been a member of

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_alliancehistory`
  - `path` -- `/corporations/{corporation_id}/alliancehistory/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_alliancehistory)

  """
  @spec alliance_history(corporation_id :: integer, opts :: alliance_history_opts) :: ESI.Request.t
  def alliance_history(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/#{corporation_id}/alliancehistory",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type corporation_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Public information about a corporation

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id`
  - `path` -- `/corporations/{corporation_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id)

  """
  @spec corporation(corporation_id :: integer, opts :: corporation_opts) :: ESI.Request.t
  def corporation(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/#{corporation_id}",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type members_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Read the current list of members if the calling character is a member.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_members`
  - `path` -- `/corporations/{corporation_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_members)

  """
  @spec members(corporation_id :: integer, opts :: members_opts) :: ESI.Request.t
  def members(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/#{corporation_id}/members",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type roles_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Return the roles of all members if the character has the personnel manager role or any grantable role.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_roles`
  - `path` -- `/corporations/{corporation_id}/roles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_roles)

  """
  @spec roles(corporation_id :: integer, opts :: roles_opts) :: ESI.Request.t
  def roles(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/#{corporation_id}/roles",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:corporation_ids` (REQUIRED) -- A comma separated list of corporation IDs
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type names_opts :: [
    corporation_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Resolve a set of corporation IDs to corporation names

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_names`
  - `path` -- `/corporations/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_names)

  """
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/names",
      query_opts: Keyword.take(opts, [:corporation_ids, :datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:page` -- Which page to query, 250 structures per page
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type structures_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    page: nil | integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Get a list of corporation structures

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_structures`
  - `path` -- `/corporations/{corporation_id}/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_structures)

  """
  @spec structures(corporation_id :: integer, opts :: structures_opts) :: ESI.Request.t
  def structures(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/#{corporation_id}/structures",
      query_opts: Keyword.take(opts, [:datasource, :language, :page, :token, :user_agent]),
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
  Get the icon urls for a corporation

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_icons`
  - `path` -- `/corporations/{corporation_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_icons)

  """
  @spec icons(corporation_id :: integer, opts :: icons_opts) :: ESI.Request.t
  def icons(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/#{corporation_id}/icons",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type npccorps_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Get a list of npc corporations

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_npccorps`
  - `path` -- `/corporations/npccorps/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_npccorps)

  """
  @spec npccorps(opts :: npccorps_opts) :: ESI.Request.t
  def npccorps(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "corporations/npccorps",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end