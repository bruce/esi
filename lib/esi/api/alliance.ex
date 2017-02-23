defmodule ESI.API.Alliance do

  @typedoc """
  - `:alliance_ids` (REQUIRED) -- A comma separated list of alliance IDs
  """
  @type names_opts :: [
    alliance_ids: [integer],
  ]

  @type names_result :: [[alliance_id: integer, alliance_name: String.t]]


  @doc """
  Resolve a set of alliance IDs to alliance names.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`names_result`](#t:names_result/0) type.

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

  @type corporations_result :: [integer]


  @doc """
  List all current member corporations of an alliance.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`corporations_result`](#t:corporations_result/0) type.

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

  @type icons_result :: [px128x128: nil | String.t, px64x64: nil | String.t]


  @doc """
  Get the icon urls for a alliance.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`icons_result`](#t:icons_result/0) type.

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

  @type alliance_result :: [alliance_name: String.t, date_founded: String.t, executor_corp: nil | integer, ticker: String.t]


  @doc """
  Public information about an alliance.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`alliance_result`](#t:alliance_result/0) type.

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

  @type alliances_result :: [integer]


  @doc """
  List all active player alliances.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`alliances_result`](#t:alliances_result/0) type.

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