defmodule ESI.API.Alliance do
  @doc """
  List all current member corporations of an alliance.

  ## Response Example

  List of corporation IDs:

      [98000001]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_corporations`
  - `path` -- `/alliances/{alliance_id}/corporations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_corporations)

  """
  @spec corporations(alliance_id :: integer) :: ESI.Request.t()
  def corporations(alliance_id) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/corporations/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @doc """
  Get the icon urls for a alliance.

  ## Response Example

  Icon URLs for the given alliance id and server:

      %{
        "px128x128" => "https://imageserver.eveonline.com/Alliance/503818424_128.png",
        "px64x64" => "https://imageserver.eveonline.com/Alliance/503818424_64.png"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_icons`
  - `path` -- `/alliances/{alliance_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_icons)

  """
  @spec icons(alliance_id :: integer) :: ESI.Request.t()
  def icons(alliance_id) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/icons/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Alliance.contact_labels/2`](#contact_labels/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type contact_labels_opts :: [contact_labels_opt]
  @type contact_labels_opt :: {:token, nil | String.t()}

  @doc """
  Return custom labels for an alliance's contacts.

  ## Response Example

  A list of alliance contact labels:

      [%{"label_id" => 1, "label_name" => "Alliance Friends"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_contacts_labels`
  - `path` -- `/alliances/{alliance_id}/contacts/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_alliances_alliance_id_contacts_labels)

  """
  @spec contact_labels(alliance_id :: integer, opts :: contact_labels_opts) :: ESI.Request.t()
  def contact_labels(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/contacts/labels/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @doc """
  Public information about an alliance.

  ## Response Example

  Public data about an alliance:

      %{
        "creator_corporation_id" => 45678,
        "creator_id" => 12345,
        "date_founded" => "2016-06-26T21:00:00Z",
        "executor_corporation_id" => 98356193,
        "name" => "C C P Alliance",
        "ticker" => "<C C P>"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id`
  - `path` -- `/alliances/{alliance_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id)

  """
  @spec alliance(alliance_id :: integer) :: ESI.Request.t()
  def alliance(alliance_id) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @doc """
  List all active player alliances.

  ## Response Example

  List of Alliance IDs:

      [99000001, 99000002]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances`
  - `path` -- `/alliances/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances)

  """
  @spec alliances() :: ESI.Request.t()
  def alliances() do
    %ESI.Request{
      verb: :get,
      path: "/alliances/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Alliance.contacts/2`](#contacts/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type contacts_opts :: [contacts_opt]
  @type contacts_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return contacts of an alliance.

  ## Response Example

  A list of contacts:

      [
        %{
          "contact_id" => 2112625428,
          "contact_type" => "character",
          "standing" => 9.9
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_contacts`
  - `path` -- `/alliances/{alliance_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_alliances_alliance_id_contacts)

  """
  @spec contacts(alliance_id :: integer, opts :: contacts_opts) :: ESI.Request.t()
  def contacts(alliance_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/contacts/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end
end
