defmodule ESI.API.Search do

  @typedoc """
Options for [`Search.search/1`](#search/1).

  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type search_opts :: [
    categories: [:agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :wormhole],
    datasource: nil | :tranquility | :singularity,
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
    user_agent: nil | String.t,
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
      opts_schema: %{categories: {:query, :required}, datasource: {:query, :optional}, language: {:query, :optional}, search: {:query, :required}, strict: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end