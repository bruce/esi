defmodule ESI.API.Fleet do

  @doc """
  Return information about fleet members

  ## Swagger

  The Swagger Operation ID for this function is `get_fleets_fleet_id_members`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type members_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec members(fleet_id :: integer, opts :: members_opts) :: ESI.Request.t
  def members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/members/",
      query_opts: Keyword.take(opts, [:datasource, :language, :token, :user_agent]),
    }
  end

  @doc """
  Invite a character into the fleet, if a character has a CSPA charge set, it is not possible to invite them to the fleet using ESI

  ## Swagger

  The Swagger Operation ID for this function is `post_fleets_fleet_id_members`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:invitation` (REQUIRED) -- Details of the invitation
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_member_opts :: [
    datasource: nil | :tranquility | :singularity,
    invitation: [character_id: nil | integer, role: nil | :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec create_member(fleet_id :: integer, opts :: create_member_opts) :: ESI.Request.t
  def create_member(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/members/",
      body_opts: Keyword.take(opts, [:invitation]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Delete a fleet squad, only empty squads can be deleted

  ## Swagger

  The Swagger Operation ID for this function is `delete_fleets_fleet_id_squads_squad_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_delete_fleets_fleet_id_squads_squad_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec delete_delete_fleets_fleet_id_squads_squad_id(fleet_id :: integer, squad_id :: integer, opts :: delete_delete_fleets_fleet_id_squads_squad_id_opts) :: ESI.Request.t
  def delete_delete_fleets_fleet_id_squads_squad_id(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/squads/#{squad_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Rename a fleet squad

  ## Swagger

  The Swagger Operation ID for this function is `put_fleets_fleet_id_squads_squad_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:naming` (REQUIRED) -- New name of the squad
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_put_fleets_fleet_id_squads_squad_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    naming: [name: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec update_put_fleets_fleet_id_squads_squad_id(fleet_id :: integer, squad_id :: integer, opts :: update_put_fleets_fleet_id_squads_squad_id_opts) :: ESI.Request.t
  def update_put_fleets_fleet_id_squads_squad_id(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/squads/#{squad_id}/",
      body_opts: Keyword.take(opts, [:naming]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Create a new squad in a fleet

  ## Swagger

  The Swagger Operation ID for this function is `post_fleets_fleet_id_wings_wing_id_squads`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_post_fleets_fleet_id_wings_wing_id_squad_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg, :word, :arg]
  @spec create_post_fleets_fleet_id_wings_wing_id_squad(fleet_id :: integer, wing_id :: integer, opts :: create_post_fleets_fleet_id_wings_wing_id_squad_opts) :: ESI.Request.t
  def create_post_fleets_fleet_id_wings_wing_id_squad(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/squads/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return details about a fleet

  ## Swagger

  The Swagger Operation ID for this function is `get_fleets_fleet_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type fleet_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg]
  @spec fleet(fleet_id :: integer, opts :: fleet_opts) :: ESI.Request.t
  def fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Update settings about a fleet

  ## Swagger

  The Swagger Operation ID for this function is `put_fleets_fleet_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:new_settings` (REQUIRED) -- What to update for this fleet
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_fleet_opts :: [
    datasource: nil | :tranquility | :singularity,
    new_settings: [is_free_move: nil | boolean, motd: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg]
  @spec update_fleet(fleet_id :: integer, opts :: update_fleet_opts) :: ESI.Request.t
  def update_fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/",
      body_opts: Keyword.take(opts, [:new_settings]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Kick a fleet member

  ## Swagger

  The Swagger Operation ID for this function is `delete_fleets_fleet_id_members_member_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_delete_fleets_fleet_id_members_member_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec delete_delete_fleets_fleet_id_members_member_id(fleet_id :: integer, member_id :: integer, opts :: delete_delete_fleets_fleet_id_members_member_id_opts) :: ESI.Request.t
  def delete_delete_fleets_fleet_id_members_member_id(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/members/#{member_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Move a fleet member around

  ## Swagger

  The Swagger Operation ID for this function is `put_fleets_fleet_id_members_member_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:movement` (REQUIRED) -- Details of the invitation
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_put_fleets_fleet_id_members_member_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    movement: [role: nil | :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec update_put_fleets_fleet_id_members_member_id(fleet_id :: integer, member_id :: integer, opts :: update_put_fleets_fleet_id_members_member_id_opts) :: ESI.Request.t
  def update_put_fleets_fleet_id_members_member_id(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/members/#{member_id}/",
      body_opts: Keyword.take(opts, [:movement]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return information about wings in a fleet

  ## Swagger

  The Swagger Operation ID for this function is `get_fleets_fleet_id_wings`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type wings_opts :: [
    datasource: nil | :tranquility | :singularity,
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec wings(fleet_id :: integer, opts :: wings_opts) :: ESI.Request.t
  def wings(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/wings/",
      query_opts: Keyword.take(opts, [:datasource, :language, :token, :user_agent]),
    }
  end

  @doc """
  Create a new wing in a fleet

  ## Swagger

  The Swagger Operation ID for this function is `post_fleets_fleet_id_wings`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_wing_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec create_wing(fleet_id :: integer, opts :: create_wing_opts) :: ESI.Request.t
  def create_wing(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/wings/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Delete a fleet wing, only empty wings can be deleted. The wing may contain squads, but the squads must be empty

  ## Swagger

  The Swagger Operation ID for this function is `delete_fleets_fleet_id_wings_wing_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_delete_fleets_fleet_id_wings_wing_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec delete_delete_fleets_fleet_id_wings_wing_id(fleet_id :: integer, wing_id :: integer, opts :: delete_delete_fleets_fleet_id_wings_wing_id_opts) :: ESI.Request.t
  def delete_delete_fleets_fleet_id_wings_wing_id(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Rename a fleet wing

  ## Swagger

  The Swagger Operation ID for this function is `put_fleets_fleet_id_wings_wing_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:naming` (REQUIRED) -- New name of the wing
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_put_fleets_fleet_id_wings_wing_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    naming: [name: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec update_put_fleets_fleet_id_wings_wing_id(fleet_id :: integer, wing_id :: integer, opts :: update_put_fleets_fleet_id_wings_wing_id_opts) :: ESI.Request.t
  def update_put_fleets_fleet_id_wings_wing_id(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/",
      body_opts: Keyword.take(opts, [:naming]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end
end