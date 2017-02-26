defmodule ESI.API.Search do

  @typedoc """
  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  """
  @type search_opts :: [
    categories: [:agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :wormhole],
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
  ]


  @doc """
  Search for entities that match a given sub-string..

  ## Response Example

  A list of search results:

      %{"solarsystem" => [30002510],
        "station" => [60004588, 60004594, 60005725, 60009106, 60012721, 60012724,
         60012727]}

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