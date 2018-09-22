defmodule ESI.API.Fleet do
  @typedoc """
  Options for [`Fleet.members/2`](#members/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  - `:token` -- Access token to use if unable to set a header
  """
  @type members_opts :: [members_opt]
  @type members_opt ::
          {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh} | {:token, nil | String.t()}

  @doc """
  Return information about fleet members.

  ## Response Example

  A list of fleet members:

      [
        %{
          "character_id" => 93265215,
          "join_time" => "2016-04-29T12:34:56Z",
          "role" => "squad_commander",
          "role_name" => "Squad Commander (Boss)",
          "ship_type_id" => 33328,
          "solar_system_id" => 30003729,
          "squad_id" => 3129411261968,
          "station_id" => 61000180,
          "takes_fleet_warp" => true,
          "wing_id" => 2073711261968
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id_members`
  - `path` -- `/fleets/{fleet_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id_members)

  """
  @spec members(fleet_id :: integer, opts :: members_opts) :: ESI.Request.t()
  def members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/members/",
      opts_schema: %{
        datasource: {:query, :optional},
        language: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.create_members/2`](#create_members/2).

  - `:invitation` (REQUIRED) -- Details of the invitation
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_members_opts :: [create_members_opt]
  @type create_members_opt ::
          {:invitation,
           [
             character_id: integer,
             role: :fleet_commander | :wing_commander | :squad_commander | :squad_member,
             squad_id: nil | integer,
             wing_id: nil | integer
           ]}
          | {:token, nil | String.t()}

  @doc """
  Invite a character into the fleet. If a character has a CSPA charge set it is not possible to invite them to the fleet using ESI.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_members`
  - `path` -- `/fleets/{fleet_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_members)

  """
  @spec create_members(fleet_id :: integer, opts :: create_members_opts) :: ESI.Request.t()
  def create_members(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/members/",
      opts_schema: %{
        datasource: {:query, :optional},
        invitation: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.delete_squad/3`](#delete_squad/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_squad_opts :: [delete_squad_opt]
  @type delete_squad_opt :: {:token, nil | String.t()}

  @doc """
  Delete a fleet squad, only empty squads can be deleted.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_squads_squad_id`
  - `path` -- `/fleets/{fleet_id}/squads/{squad_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_squads_squad_id)

  """
  @spec delete_squad(fleet_id :: integer, squad_id :: integer, opts :: delete_squad_opts) ::
          ESI.Request.t()
  def delete_squad(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/squads/#{squad_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.update_squad/3`](#update_squad/3).

  - `:naming` (REQUIRED) -- New name of the squad
  - `:token` -- Access token to use if unable to set a header
  """
  @type update_squad_opts :: [update_squad_opt]
  @type update_squad_opt :: {:naming, [name: String.t()]} | {:token, nil | String.t()}

  @doc """
  Rename a fleet squad.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_squads_squad_id`
  - `path` -- `/fleets/{fleet_id}/squads/{squad_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_squads_squad_id)

  """
  @spec update_squad(fleet_id :: integer, squad_id :: integer, opts :: update_squad_opts) ::
          ESI.Request.t()
  def update_squad(fleet_id, squad_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/squads/#{squad_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        naming: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.create_squads/3`](#create_squads/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type create_squads_opts :: [create_squads_opt]
  @type create_squads_opt :: {:token, nil | String.t()}

  @doc """
  Create a new squad in a fleet.

  ## Response Example

  Squad created:

      %{"squad_id" => 123}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_wings_wing_id_squads`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/squads/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_wings_wing_id_squads)

  """
  @spec create_squads(fleet_id :: integer, wing_id :: integer, opts :: create_squads_opts) ::
          ESI.Request.t()
  def create_squads(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/squads/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.fleet/2`](#fleet/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type fleet_opts :: [fleet_opt]
  @type fleet_opt :: {:token, nil | String.t()}

  @doc """
  Return details about a fleet.

  ## Response Example

  Details about a fleet:

      %{
        "is_free_move" => false,
        "is_registered" => false,
        "is_voice_enabled" => false,
        "motd" => "This is an <b>awesome</b> fleet!"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id`
  - `path` -- `/fleets/{fleet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id)

  """
  @spec fleet(fleet_id :: integer, opts :: fleet_opts) :: ESI.Request.t()
  def fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.update_fleet/2`](#update_fleet/2).

  - `:new_settings` (REQUIRED) -- What to update for this fleet
  - `:token` -- Access token to use if unable to set a header
  """
  @type update_fleet_opts :: [update_fleet_opt]
  @type update_fleet_opt ::
          {:new_settings, [is_free_move: nil | boolean, motd: nil | String.t()]}
          | {:token, nil | String.t()}

  @doc """
  Update settings about a fleet.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id`
  - `path` -- `/fleets/{fleet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id)

  """
  @spec update_fleet(fleet_id :: integer, opts :: update_fleet_opts) :: ESI.Request.t()
  def update_fleet(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        new_settings: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.delete_member/3`](#delete_member/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_member_opts :: [delete_member_opt]
  @type delete_member_opt :: {:token, nil | String.t()}

  @doc """
  Kick a fleet member.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_members_member_id`
  - `path` -- `/fleets/{fleet_id}/members/{member_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_members_member_id)

  """
  @spec delete_member(fleet_id :: integer, member_id :: integer, opts :: delete_member_opts) ::
          ESI.Request.t()
  def delete_member(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/members/#{member_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.update_member/3`](#update_member/3).

  - `:movement` (REQUIRED) -- Details of the invitation
  - `:token` -- Access token to use if unable to set a header
  """
  @type update_member_opts :: [update_member_opt]
  @type update_member_opt ::
          {:movement,
           [
             role: :fleet_commander | :wing_commander | :squad_commander | :squad_member,
             squad_id: nil | integer,
             wing_id: nil | integer
           ]}
          | {:token, nil | String.t()}

  @doc """
  Move a fleet member around.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_members_member_id`
  - `path` -- `/fleets/{fleet_id}/members/{member_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_members_member_id)

  """
  @spec update_member(fleet_id :: integer, member_id :: integer, opts :: update_member_opts) ::
          ESI.Request.t()
  def update_member(fleet_id, member_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/members/#{member_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        movement: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.wings/2`](#wings/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  - `:token` -- Access token to use if unable to set a header
  """
  @type wings_opts :: [wings_opt]
  @type wings_opt ::
          {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh} | {:token, nil | String.t()}

  @doc """
  Return information about wings in a fleet.

  ## Response Example

  A list of fleet wings:

      [
        %{
          "id" => 2073711261968,
          "name" => "Wing 1",
          "squads" => [%{"id" => 3129411261968, "name" => "Squad 1"}]
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_fleets_fleet_id_wings`
  - `path` -- `/fleets/{fleet_id}/wings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_fleets_fleet_id_wings)

  """
  @spec wings(fleet_id :: integer, opts :: wings_opts) :: ESI.Request.t()
  def wings(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/fleets/#{fleet_id}/wings/",
      opts_schema: %{
        datasource: {:query, :optional},
        language: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.create_wings/2`](#create_wings/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type create_wings_opts :: [create_wings_opt]
  @type create_wings_opt :: {:token, nil | String.t()}

  @doc """
  Create a new wing in a fleet.

  ## Response Example

  Wing created:

      %{"wing_id" => 123}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_fleets_fleet_id_wings`
  - `path` -- `/fleets/{fleet_id}/wings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/post_fleets_fleet_id_wings)

  """
  @spec create_wings(fleet_id :: integer, opts :: create_wings_opts) :: ESI.Request.t()
  def create_wings(fleet_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/fleets/#{fleet_id}/wings/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.delete_wing/3`](#delete_wing/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_wing_opts :: [delete_wing_opt]
  @type delete_wing_opt :: {:token, nil | String.t()}

  @doc """
  Delete a fleet wing, only empty wings can be deleted. The wing may contain squads, but the squads must be empty.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_fleets_fleet_id_wings_wing_id`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/delete_fleets_fleet_id_wings_wing_id)

  """
  @spec delete_wing(fleet_id :: integer, wing_id :: integer, opts :: delete_wing_opts) ::
          ESI.Request.t()
  def delete_wing(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Fleet.update_wing/3`](#update_wing/3).

  - `:naming` (REQUIRED) -- New name of the wing
  - `:token` -- Access token to use if unable to set a header
  """
  @type update_wing_opts :: [update_wing_opt]
  @type update_wing_opt :: {:naming, [name: String.t()]} | {:token, nil | String.t()}

  @doc """
  Rename a fleet wing.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_fleets_fleet_id_wings_wing_id`
  - `path` -- `/fleets/{fleet_id}/wings/{wing_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/put_fleets_fleet_id_wings_wing_id)

  """
  @spec update_wing(fleet_id :: integer, wing_id :: integer, opts :: update_wing_opts) ::
          ESI.Request.t()
  def update_wing(fleet_id, wing_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/fleets/#{fleet_id}/wings/#{wing_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        naming: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end
end
