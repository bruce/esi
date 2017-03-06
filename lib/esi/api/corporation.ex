defmodule ESI.API.Corporation do

  @doc """
  Get a list of all the alliances a corporation has been a member of.

  ## Response Example

  Alliance history for the given corporation:

      [%{"alliance" => %{"alliance_id" => 99000006, "is_deleted" => false},
         "record_id" => 23, "start_date" => "2016-10-25T14:46:00Z"},
       %{"record_id" => 1, "start_date" => "2015-07-06T20:56:00Z"}]

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Public information about a corporation.

  ## Response Example

  Public data about a corporation:

      %{"alliance_id" => 434243723, "ceo_id" => 180548812,
        "corporation_description" => "This is a corporation description, it's basically just a string",
        "corporation_name" => "C C P", "creation_date" => "2004-11-28T16:42:51Z",
        "creator_id" => 180548812, "member_count" => 656, "tax_rate" => 0.256,
        "ticker" => "-CCP-", "url" => "http://www.eveonline.com"}

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Corporation.members/2`](#members/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type members_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Read the current list of members if the calling character is a member..

  ## Response Example

  List of member character IDs:

      [%{"character_id" => 90000001}, %{"character_id" => 90000002}]

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
      path: "/corporations/#{corporation_id}/members/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Corporation.roles/2`](#roles/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type roles_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Return the roles of all members if the character has the personnel manager role or any grantable role..

  ## Response Example

  List of member character ID's and roles:

      [%{"character_id" => 1000171, "roles" => ["Director", "Station_Manager"]}]

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
      path: "/corporations/#{corporation_id}/roles/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Corporation.names/1`](#names/1).

  - `:corporation_ids` (REQUIRED) -- A comma separated list of corporation IDs
  """
  @type names_opts :: [
    corporation_ids: [integer],
  ]


  @doc """
  Resolve a set of corporation IDs to corporation names.

  ## Response Example

  List of id/name associations:

      [%{"corporation_id" => 1000171, "corporation_name" => "Republic University"}]

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
      opts_schema: %{corporation_ids: {:query, :required}, datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Corporation.structures/2`](#structures/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:page` -- Which page to query, 250 structures per page
  - `:token` -- Access token to use, if preferred over a header
  """
  @type structures_opts :: [
    language: nil | :de | :"en-us" | :fr | :ja | :ru | :zh,
    page: nil | integer,
    token: nil | String.t,
  ]


  @doc """
  Get a list of corporation structures.

  ## Response Example

  List of corporation structures' information:

      [%{"corporation_id" => 667531913, "current_vul" => [%{"day" => 1, "hour" => 2}],
         "next_vul" => [%{"day" => 3, "hour" => 4}], "profile_id" => 11237,
         "structure_id" => 1021975535893, "system_id" => 30004763,
         "type_id" => 35833}]

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
      opts_schema: %{datasource: {:query, :optional}, language: {:query, :optional}, page: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get the icon urls for a corporation.

  ## Response Example

  Urls for icons for the given corporation id and server:

      %{"px128x128" => "https://imageserver.eveonline.com/Corporation/1000010_128.png",
        "px256x256" => "https://imageserver.eveonline.com/Corporation/1000010_256.png",
        "px64x64" => "https://imageserver.eveonline.com/Corporation/1000010_64.png"}

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @doc """
  Get a list of npc corporations.

  ## Response Example

  A list of npc corporation ids:

      [1000001, 1000002, 1000003]

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Corporation.update_structure/3`](#update_structure/3).

  - `:new_schedule` (REQUIRED) -- New vulnerability window schedule for the structure
  - `:token` -- Access token to use, if preferred over a header
  """
  @type update_structure_opts :: [
    new_schedule: [nil | [day: integer, hour: integer]],
    token: nil | String.t,
  ]


  @doc """
  Update the vulnerability window schedule of a corporation structure.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_corporations_corporation_id_structures_structure_id`
  - `path` -- `/corporations/{corporation_id}/structures/{structure_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/put_corporations_corporation_id_structures_structure_id)

  """
  @spec update_structure(corporation_id :: integer, structure_id :: integer, opts :: update_structure_opts) :: ESI.Request.t
  def update_structure(corporation_id, structure_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/corporations/#{corporation_id}/structures/#{structure_id}/",
      opts_schema: %{datasource: {:query, :optional}, new_schedule: {:body, :required}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end