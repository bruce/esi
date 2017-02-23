defmodule ESI.API.Fleet do

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type members_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type members_result :: [[character_id: integer, join_time: String.t, role: :fleet_commander | :wing_commander | :squad_commander | :squad_member, role_name: String.t, ship_type_id: integer, solar_system_id: integer, squad_id: integer, station_id: nil | integer, takes_fleet_warp: boolean, wing_id: integer]]


  @doc """
  Return information about fleet members.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`members_result`](#t:members_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id_members`
  - `path` -- `/fleets/{fleet_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id_members)

  """
  @spec members(fleet_id :: integer, opts :: members_opts) :: ESI.Request.t
  def members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/members/",
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @typedoc """
  - `:invitation` (REQUIRED) -- Details of the invitation
  """
  @type create_members_opts :: [
    invitation: [character_id: integer, role: :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
  ]

  @type create_members_result :: any


  @doc """
  Invite a character into the fleet, if a character has a CSPA charge set, it is not possible to invite them to the fleet using ESI.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_members_result`](#t:create_members_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_members`
  - `path` -- `/fleets/{fleet_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_members)

  """
  @spec create_members(fleet_id :: integer, opts :: create_members_opts) :: ESI.Request.t
  def create_members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/members/",
      body_opts: Keyword.take(opts, [:invitation]),
    }
  end

  @type delete_squad_result :: any


  @doc """
  Delete a fleet squad, only empty squads can be deleted.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_squad_result`](#t:delete_squad_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_squads_squad_id`
  - `path` -- `/fleets/{fleet_id}/squads/{squad_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_squads_squad_id)

  """
  @spec delete_squad(fleet_id :: integer, squad_id :: integer) :: ESI.Request.t
  def delete_squad(fleet_id, squad_id) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/squads/#{squad_id}/",

    }
  end

  @typedoc """
  - `:naming` (REQUIRED) -- New name of the squad
  """
  @type update_squad_opts :: [
    naming: [name: String.t],
  ]

  @type update_squad_result :: any


  @doc """
  Rename a fleet squad.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_squad_result`](#t:update_squad_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_squads_squad_id`
  - `path` -- `/fleets/{fleet_id}/squads/{squad_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_squads_squad_id)

  """
  @spec update_squad(fleet_id :: integer, squad_id :: integer, opts :: update_squad_opts) :: ESI.Request.t
  def update_squad(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/squads/#{squad_id}/",
      body_opts: Keyword.take(opts, [:naming]),
    }
  end

  @type create_squads_result :: [squad_id: integer]


  @doc """
  Create a new squad in a fleet.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_squads_result`](#t:create_squads_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_wings_wing_id_squads`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/squads/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_wings_wing_id_squads)

  """
  @spec create_squads(fleet_id :: integer, wing_id :: integer) :: ESI.Request.t
  def create_squads(fleet_id, wing_id) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/squads/",

    }
  end

  @type fleet_result :: [is_free_move: boolean, is_registered: boolean, is_voice_enabled: boolean, motd: String.t]


  @doc """
  Return details about a fleet.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`fleet_result`](#t:fleet_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id`
  - `path` -- `/fleets/{fleet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id)

  """
  @spec fleet(fleet_id :: integer) :: ESI.Request.t
  def fleet(fleet_id) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/",

    }
  end

  @typedoc """
  - `:new_settings` (REQUIRED) -- What to update for this fleet
  """
  @type update_fleet_opts :: [
    new_settings: [is_free_move: nil | boolean, motd: nil | String.t],
  ]

  @type update_fleet_result :: any


  @doc """
  Update settings about a fleet.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_fleet_result`](#t:update_fleet_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id`
  - `path` -- `/fleets/{fleet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id)

  """
  @spec update_fleet(fleet_id :: integer, opts :: update_fleet_opts) :: ESI.Request.t
  def update_fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/",
      body_opts: Keyword.take(opts, [:new_settings]),
    }
  end

  @type delete_member_result :: any


  @doc """
  Kick a fleet member.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_member_result`](#t:delete_member_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_members_member_id`
  - `path` -- `/fleets/{fleet_id}/members/{member_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_members_member_id)

  """
  @spec delete_member(fleet_id :: integer, member_id :: integer) :: ESI.Request.t
  def delete_member(fleet_id, member_id) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/members/#{member_id}/",

    }
  end

  @typedoc """
  - `:movement` (REQUIRED) -- Details of the invitation
  """
  @type update_member_opts :: [
    movement: [role: :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
  ]

  @type update_member_result :: any


  @doc """
  Move a fleet member around.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_member_result`](#t:update_member_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_members_member_id`
  - `path` -- `/fleets/{fleet_id}/members/{member_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_members_member_id)

  """
  @spec update_member(fleet_id :: integer, member_id :: integer, opts :: update_member_opts) :: ESI.Request.t
  def update_member(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/members/#{member_id}/",
      body_opts: Keyword.take(opts, [:movement]),
    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type wings_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]

  @type wings_result :: [[id: integer, name: String.t, squads: [[id: integer, name: String.t]]]]


  @doc """
  Return information about wings in a fleet.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`wings_result`](#t:wings_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id_wings`
  - `path` -- `/fleets/{fleet_id}/wings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id_wings)

  """
  @spec wings(fleet_id :: integer, opts :: wings_opts) :: ESI.Request.t
  def wings(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/wings/",
      query_opts: Keyword.take(opts, [:language]),
    }
  end

  @type create_wings_result :: [wing_id: integer]


  @doc """
  Create a new wing in a fleet.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_wings_result`](#t:create_wings_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_wings`
  - `path` -- `/fleets/{fleet_id}/wings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_wings)

  """
  @spec create_wings(fleet_id :: integer) :: ESI.Request.t
  def create_wings(fleet_id) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/wings/",

    }
  end

  @type delete_wing_result :: any


  @doc """
  Delete a fleet wing, only empty wings can be deleted. The wing may contain squads, but the squads must be empty.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_wing_result`](#t:delete_wing_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_wings_wing_id`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_wings_wing_id)

  """
  @spec delete_wing(fleet_id :: integer, wing_id :: integer) :: ESI.Request.t
  def delete_wing(fleet_id, wing_id) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/",

    }
  end

  @typedoc """
  - `:naming` (REQUIRED) -- New name of the wing
  """
  @type update_wing_opts :: [
    naming: [name: String.t],
  ]

  @type update_wing_result :: any


  @doc """
  Rename a fleet wing.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_wing_result`](#t:update_wing_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_wings_wing_id`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_wings_wing_id)

  """
  @spec update_wing(fleet_id :: integer, wing_id :: integer, opts :: update_wing_opts) :: ESI.Request.t
  def update_wing(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/",
      body_opts: Keyword.take(opts, [:naming]),
    }
  end
end