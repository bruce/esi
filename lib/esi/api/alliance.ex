defmodule ESI.API.Alliance do

  @typedoc """
  - `:alliance_ids` (REQUIRED) -- A comma separated list of alliance IDs
  """
  @type names_opts :: [
    alliance_ids: [integer],
  ]


  @doc """
  Resolve a set of alliance IDs to alliance names.

  ## Response Example

  List of id/name associations:

      [%{"alliance_id" => 1000171, "alliance_name" => "Republic University"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_names`
  - `path` -- `/alliances/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_names)

  """
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/names/",
      query_opts: Keyword.take(opts, [:alliance_ids]),
    }
  end

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
  @spec corporations(alliance_id :: integer) :: ESI.Request.t
  def corporations(alliance_id) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/corporations/",

    }
  end

  @doc """
  Get the icon urls for a alliance.

  ## Response Example

  Urls for icons for the given alliance id and server:

      %{"px128x128" => "https://imageserver.eveonline.com/Alliance/503818424_128.png",
        "px64x64" => "https://imageserver.eveonline.com/Alliance/503818424_64.png"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id_icons`
  - `path` -- `/alliances/{alliance_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id_icons)

  """
  @spec icons(alliance_id :: integer) :: ESI.Request.t
  def icons(alliance_id) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/icons/",

    }
  end

  @doc """
  Public information about an alliance.

  ## Response Example

  Public data about an alliance:

      %{"alliance_name" => "C C P Alliance", "date_founded" => "2016-06-26T21:00:00Z",
        "executor_corp" => 98356193, "ticker" => "<C C P>"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_alliances_alliance_id`
  - `path` -- `/alliances/{alliance_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Alliance/get_alliances_alliance_id)

  """
  @spec alliance(alliance_id :: integer) :: ESI.Request.t
  def alliance(alliance_id) do
    %ESI.Request{
      verb: :get,
      path: "/alliances/#{alliance_id}/",

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
  @spec alliances() :: ESI.Request.t
  def alliances() do
    %ESI.Request{
      verb: :get,
      path: "/alliances/",

    }
  end
end