defmodule ESI.API.Corporation do

  @doc """
  Get a list of all the alliances a corporation has been a member of

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_corporation_id_alliancehistory`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type alliancehistory_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec alliancehistory(corporation_id :: integer, opts :: alliancehistory_opts) :: ESI.Request.t
  def alliancehistory(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/alliancehistory/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Public information about a corporation

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_corporation_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type corporation_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg]
  @spec corporation(corporation_id :: integer, opts :: corporation_opts) :: ESI.Request.t
  def corporation(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Read the current list of members if the calling character is a member.

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_corporation_id_members`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type members_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec members(corporation_id :: integer, opts :: members_opts) :: ESI.Request.t
  def members(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/members/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return the roles of all members if the character has the personnel manager role or any grantable role.

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_corporation_id_roles`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type roles_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec roles(corporation_id :: integer, opts :: roles_opts) :: ESI.Request.t
  def roles(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/roles/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Resolve a set of corporation IDs to corporation names

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_names`

  ## Options

  - `:corporation_ids` (REQUIRED) -- A comma separated list of corporation IDs
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type names_opts :: [
    corporation_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/names/",
      query_opts: Keyword.take(opts, [:corporation_ids, :datasource, :user_agent]),
    }
  end

  @doc """
  Get a list of corporation structures

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_corporation_id_structures`

  ## Options

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
  # [:word, :arg]
  @spec structures(corporation_id :: integer, opts :: structures_opts) :: ESI.Request.t
  def structures(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/structures/",
      query_opts: Keyword.take(opts, [:datasource, :language, :page, :token, :user_agent]),
    }
  end

  @doc """
  Get the icon urls for a corporation

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_corporation_id_icons`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type icons_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec icons(corporation_id :: integer, opts :: icons_opts) :: ESI.Request.t
  def icons(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/icons/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Get a list of npc corporations

  ## Swagger

  The Swagger Operation ID for this function is `get_corporations_npccorps`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type npccorps_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec npccorps(opts :: npccorps_opts) :: ESI.Request.t
  def npccorps(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/npccorps/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end