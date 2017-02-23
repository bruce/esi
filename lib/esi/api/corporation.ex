defmodule ESI.API.Corporation do

  @type alliance_history_result :: [[alliance: nil | [alliance_id: integer, is_deleted: boolean], record_id: integer, start_date: String.t]]


  @doc """
  Get a list of all the alliances a corporation has been a member of.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`alliance_history_result`](#t:alliance_history_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_alliancehistory`
  - `path` -- `/corporations/{corporation_id}/alliancehistory/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_alliancehistory)

  """
  @spec alliance_history(corporation_id :: integer) :: ESI.Request.t
  def alliance_history(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/alliancehistory/",

    }
  end

  @type corporation_result :: [alliance_id: nil | integer, ceo_id: integer, corporation_name: String.t, member_count: integer, ticker: String.t]


  @doc """
  Public information about a corporation.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`corporation_result`](#t:corporation_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id`
  - `path` -- `/corporations/{corporation_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id)

  """
  @spec corporation(corporation_id :: integer) :: ESI.Request.t
  def corporation(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/",

    }
  end

  @type members_result :: [[character_id: integer]]


  @doc """
  Read the current list of members if the calling character is a member..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`members_result`](#t:members_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_members`
  - `path` -- `/corporations/{corporation_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_members)

  """
  @spec members(corporation_id :: integer) :: ESI.Request.t
  def members(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/members/",

    }
  end

  @type roles_result :: [[character_id: integer, grantable_roles: nil | [String.t], grantable_roles_at_base: nil | [String.t], grantable_roles_at_hq: nil | [String.t], grantable_roles_at_other: nil | [String.t], roles: nil | [String.t], roles_at_base: nil | [String.t], roles_at_hq: nil | [String.t], roles_at_other: nil | [String.t]]]


  @doc """
  Return the roles of all members if the character has the personnel manager role or any grantable role..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`roles_result`](#t:roles_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_roles`
  - `path` -- `/corporations/{corporation_id}/roles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_roles)

  """
  @spec roles(corporation_id :: integer) :: ESI.Request.t
  def roles(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/roles/",

    }
  end

  @typedoc """
  - `:corporation_ids` (REQUIRED) -- A comma separated list of corporation IDs
  """
  @type names_opts :: [
    corporation_ids: [integer],
  ]

  @type names_result :: [[corporation_id: integer, corporation_name: String.t]]


  @doc """
  Resolve a set of corporation IDs to corporation names.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`names_result`](#t:names_result/0) type.

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
      path: "/corporations/names/",
      query_opts: Keyword.take(opts, [:corporation_ids]),
    }
  end

  @typedoc """
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:page` -- Which page to query, 250 structures per page
  """
  @type structures_opts :: [
    language: nil | String.t,
    page: nil | integer,
  ]

  @type structures_result :: [[corporation_id: integer, current_vul: String.t, fuel_expires: nil | String.t, next_vul: String.t, profile_id: integer, services: nil | String.t, state_timer_end: nil | String.t, state_timer_start: nil | String.t, structure_id: integer, system_id: integer, type_id: integer, unanchors_at: nil | String.t]]


  @doc """
  Get a list of corporation structures.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`structures_result`](#t:structures_result/0) type.

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
      path: "/corporations/#{corporation_id}/structures/",
      query_opts: Keyword.take(opts, [:language, :page]),
    }
  end

  @type icons_result :: [px128x128: nil | String.t, px256x256: nil | String.t, px64x64: nil | String.t]


  @doc """
  Get the icon urls for a corporation.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`icons_result`](#t:icons_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_icons`
  - `path` -- `/corporations/{corporation_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_icons)

  """
  @spec icons(corporation_id :: integer) :: ESI.Request.t
  def icons(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/icons/",

    }
  end

  @type npccorps_result :: [integer]


  @doc """
  Get a list of npc corporations.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`npccorps_result`](#t:npccorps_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_npccorps`
  - `path` -- `/corporations/npccorps/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_npccorps)

  """
  @spec npccorps() :: ESI.Request.t
  def npccorps() do
    %ESI.Request{
      verb: :get,
      path: "/corporations/npccorps/",

    }
  end
end