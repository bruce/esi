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

  @type roles_result :: [[character_id: integer, grantable_roles: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], grantable_roles_at_base: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], grantable_roles_at_hq: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], grantable_roles_at_other: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], roles: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], roles_at_base: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], roles_at_hq: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer], roles_at_other: nil | [:Director | :Personnel_Manager | :Accountant | :Security_Officer | :Factory_Manager | :Station_Manager | :Auditor | :Hangar_Take_1 | :Hangar_Take_2 | :Hangar_Take_3 | :Hangar_Take_4 | :Hangar_Take_5 | :Hangar_Take_6 | :Hangar_Take_7 | :Hangar_Query_1 | :Hangar_Query_2 | :Hangar_Query_3 | :Hangar_Query_4 | :Hangar_Query_5 | :Hangar_Query_6 | :Hangar_Query_7 | :Account_Take_1 | :Account_Take_2 | :Account_Take_3 | :Account_Take_4 | :Account_Take_5 | :Account_Take_6 | :Account_Take_7 | :Diplomat | :Config_Equipment | :Container_Take_1 | :Container_Take_2 | :Container_Take_3 | :Container_Take_4 | :Container_Take_5 | :Container_Take_6 | :Container_Take_7 | :Rent_Office | :Rent_Factory_Facility | :Rent_Research_Facility | :Junior_Accountant | :Config_Starbase_Equipment | :Trader | :Communications_Officer | :Contract_Manager | :Starbase_Defense_Operator | :Starbase_Fuel_Technician | :Fitting_Manager | :Terrestrial_Combat_Officer | :Terrestrial_Logistics_Officer]]]


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
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
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