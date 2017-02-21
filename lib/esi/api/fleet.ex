defmodule ESI.API.Fleet do

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  """
  @type members_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
  ]


  @doc """
  Return information about fleet members.

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
    invitation: [character_id: nil | integer, role: nil | :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
  ]


  @doc """
  Invite a character into the fleet, if a character has a CSPA charge set, it is not possible to invite them to the fleet using ESI.

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

  @doc """
  Delete a fleet squad, only empty squads can be deleted.

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
    naming: [name: nil | String.t],
  ]


  @doc """
  Rename a fleet squad.

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

  @doc """
  Create a new squad in a fleet.

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

  @doc """
  Return details about a fleet.

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


  @doc """
  Update settings about a fleet.

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

  @doc """
  Kick a fleet member.

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
    movement: [role: nil | :fleet_commander | :wing_commander | :squad_commander | :squad_member, squad_id: nil | integer, wing_id: nil | integer],
  ]


  @doc """
  Move a fleet member around.

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


  @doc """
  Return information about wings in a fleet.

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

  @doc """
  Create a new wing in a fleet.

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

  @doc """
  Delete a fleet wing, only empty wings can be deleted. The wing may contain squads, but the squads must be empty.

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
    naming: [name: nil | String.t],
  ]


  @doc """
  Rename a fleet wing.

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