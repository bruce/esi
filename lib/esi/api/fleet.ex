defmodule ESI.API.Fleet do

  @typedoc """
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


  @doc """
  Return information about fleet members

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id_members`
  - `path` -- `/fleets/{fleet_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id_members)

  """
  @spec members(fleet_id :: integer, opts :: members_opts) :: ESI.Request.t
  def members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "fleets/#{fleet_id}/members",
      query_opts: Keyword.take(opts, [:datasource, :language, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:invitation` (REQUIRED) -- Details of the invitation
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_members_opts :: [
    datasource: nil | :tranquility | :singularity,
    invitation: [character_id: nil | integer, role: nil | :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Invite a character into the fleet, if a character has a CSPA charge set, it is not possible to invite them to the fleet using ESI

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_members`
  - `path` -- `/fleets/{fleet_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_members)

  """
  @spec create_members(fleet_id :: integer, opts :: create_members_opts) :: ESI.Request.t
  def create_members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "fleets/#{fleet_id}/members",
      body_opts: Keyword.take(opts, [:invitation]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_squad_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Delete a fleet squad, only empty squads can be deleted

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_squads_squad_id`
  - `path` -- `/fleets/{fleet_id}/squads/{squad_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_squads_squad_id)

  """
  @spec delete_squad(fleet_id :: integer, squad_id :: integer, opts :: delete_squad_opts) :: ESI.Request.t
  def delete_squad(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "fleets/#{fleet_id}/squads/#{squad_id}",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:naming` (REQUIRED) -- New name of the squad
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_squad_opts :: [
    datasource: nil | :tranquility | :singularity,
    naming: [name: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Rename a fleet squad

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_squads_squad_id`
  - `path` -- `/fleets/{fleet_id}/squads/{squad_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_squads_squad_id)

  """
  @spec update_squad(fleet_id :: integer, squad_id :: integer, opts :: update_squad_opts) :: ESI.Request.t
  def update_squad(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "fleets/#{fleet_id}/squads/#{squad_id}",
      body_opts: Keyword.take(opts, [:naming]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_squads_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Create a new squad in a fleet

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_wings_wing_id_squads`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/squads/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_wings_wing_id_squads)

  """
  @spec create_squads(fleet_id :: integer, wing_id :: integer, opts :: create_squads_opts) :: ESI.Request.t
  def create_squads(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "fleets/#{fleet_id}/wings/#{wing_id}/squads",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type fleet_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Return details about a fleet

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id`
  - `path` -- `/fleets/{fleet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id)

  """
  @spec fleet(fleet_id :: integer, opts :: fleet_opts) :: ESI.Request.t
  def fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "fleets/#{fleet_id}",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
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


  @doc """
  Update settings about a fleet

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id`
  - `path` -- `/fleets/{fleet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id)

  """
  @spec update_fleet(fleet_id :: integer, opts :: update_fleet_opts) :: ESI.Request.t
  def update_fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "fleets/#{fleet_id}",
      body_opts: Keyword.take(opts, [:new_settings]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_member_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Kick a fleet member

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_members_member_id`
  - `path` -- `/fleets/{fleet_id}/members/{member_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_members_member_id)

  """
  @spec delete_member(fleet_id :: integer, member_id :: integer, opts :: delete_member_opts) :: ESI.Request.t
  def delete_member(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "fleets/#{fleet_id}/members/#{member_id}",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:movement` (REQUIRED) -- Details of the invitation
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_member_opts :: [
    datasource: nil | :tranquility | :singularity,
    movement: [role: nil | :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Move a fleet member around

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_members_member_id`
  - `path` -- `/fleets/{fleet_id}/members/{member_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_members_member_id)

  """
  @spec update_member(fleet_id :: integer, member_id :: integer, opts :: update_member_opts) :: ESI.Request.t
  def update_member(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "fleets/#{fleet_id}/members/#{member_id}",
      body_opts: Keyword.take(opts, [:movement]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
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


  @doc """
  Return information about wings in a fleet

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id_wings`
  - `path` -- `/fleets/{fleet_id}/wings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id_wings)

  """
  @spec wings(fleet_id :: integer, opts :: wings_opts) :: ESI.Request.t
  def wings(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "fleets/#{fleet_id}/wings",
      query_opts: Keyword.take(opts, [:datasource, :language, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_wings_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Create a new wing in a fleet

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_wings`
  - `path` -- `/fleets/{fleet_id}/wings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_wings)

  """
  @spec create_wings(fleet_id :: integer, opts :: create_wings_opts) :: ESI.Request.t
  def create_wings(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "fleets/#{fleet_id}/wings",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_wing_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Delete a fleet wing, only empty wings can be deleted. The wing may contain squads, but the squads must be empty

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_wings_wing_id`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_wings_wing_id)

  """
  @spec delete_wing(fleet_id :: integer, wing_id :: integer, opts :: delete_wing_opts) :: ESI.Request.t
  def delete_wing(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "fleets/#{fleet_id}/wings/#{wing_id}",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:naming` (REQUIRED) -- New name of the wing
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_wing_opts :: [
    datasource: nil | :tranquility | :singularity,
    naming: [name: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]


  @doc """
  Rename a fleet wing

  ## Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_wings_wing_id`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_wings_wing_id)

  """
  @spec update_wing(fleet_id :: integer, wing_id :: integer, opts :: update_wing_opts) :: ESI.Request.t
  def update_wing(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "fleets/#{fleet_id}/wings/#{wing_id}",
      body_opts: Keyword.take(opts, [:naming]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end
end