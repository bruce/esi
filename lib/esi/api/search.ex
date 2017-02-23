defmodule ESI.API.Search do

  @typedoc """
  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  """
  @type search_opts :: [
    categories: [String.t],
    language: nil | String.t,
    search: String.t,
    strict: nil | boolean,
  ]

  @type search_result :: [agent: nil | [integer], alliance: nil | [integer], character: nil | [integer], constellation: nil | [integer], corporation: nil | [integer], faction: nil | [integer], inventorytype: nil | [integer], region: nil | [integer], solarsystem: nil | [integer], station: nil | [integer], wormhole: nil | [integer]]


  @doc """
  Search for entities that match a given sub-string..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`search_result`](#t:search_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_search`
  - `path` -- `/search/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Search/get_search)

  """
  @spec search(opts :: search_opts) :: ESI.Request.t
  def search(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/search/",
      query_opts: Keyword.take(opts, [:categories, :language, :search, :strict]),
    }
  end
end