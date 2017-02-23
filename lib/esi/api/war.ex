defmodule ESI.API.War do

  @typedoc """
  - `:max_war_id` -- Only return wars with ID smaller than this.
  """
  @type wars_opts :: [
    max_war_id: nil | integer,
  ]

  @type wars_result :: [integer]


  @doc """
  Return a list of wars.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`wars_result`](#t:wars_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_wars`
  - `path` -- `/wars/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars)

  """
  @spec wars(opts :: wars_opts) :: ESI.Request.t
  def wars(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/wars/",
      query_opts: Keyword.take(opts, [:max_war_id]),
    }
  end

  @typedoc """
  - `:page` (DEFAULT: `1`) -- Which page to query, starting at 1, 2000 killmails per page.
  """
  @type killmails_opts :: [
    page: nil | integer,
  ]

  @type killmails_result :: [[killmail_hash: String.t, killmail_id: integer]]


  @doc """
  Return a list of kills related to a war.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`killmails_result`](#t:killmails_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_wars_war_id_killmails`
  - `path` -- `/wars/{war_id}/killmails/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars_war_id_killmails)

  """
  @spec killmails(war_id :: integer, opts :: killmails_opts) :: ESI.Request.t
  def killmails(war_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/wars/#{war_id}/killmails/",
      query_opts: Keyword.take(opts, [:page]),
    }
  end

  @type war_result :: [aggressor: [alliance_id: nil | integer, corporation_id: nil | integer, isk_destroyed: float, ships_killed: integer], allies: nil | [[alliance_id: nil | integer, corporation_id: nil | integer]], declared: String.t, defender: [alliance_id: nil | integer, corporation_id: nil | integer, isk_destroyed: float, ships_killed: integer], finished: nil | String.t, id: integer, mutual: boolean, open_for_allies: boolean, retracted: nil | String.t, started: nil | String.t]


  @doc """
  Return details about a war.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`war_result`](#t:war_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_wars_war_id`
  - `path` -- `/wars/{war_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars_war_id)

  """
  @spec war(war_id :: integer) :: ESI.Request.t
  def war(war_id) do
    %ESI.Request{
      verb: :get,
      path: "/wars/#{war_id}/",

    }
  end
end