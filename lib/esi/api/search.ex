defmodule ESI.API.Search do

  @doc """
  Search for entities that match a given sub-string.

  ## Swagger

  The Swagger Operation ID for this function is `get_search`

  ## Options

  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type search_opts :: [
    categories: [nil | :agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :wormhole],
    datasource: nil | :tranquility | :singularity,
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
    user_agent: nil | String.t,
  ]
  # []
  @spec search(opts :: search_opts) :: ESI.Request.t
  def search(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/search/",
      query_opts: Keyword.take(opts, [:categories, :datasource, :language, :search, :strict, :user_agent]),
    }
  end
end