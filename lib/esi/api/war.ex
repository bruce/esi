defmodule ESI.API.War do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:max_war_id` -- Only return wars with ID smaller than this.
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type wars_opts :: [
    datasource: nil | :tranquility | :singularity,
    max_war_id: nil | integer,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of wars

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
      path: "wars",
      query_opts: Keyword.take(opts, [:datasource, :max_war_id, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:page` (DEFAULT: `1`) -- Which page to query, starting at 1, 2000 killmails per page.
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type killmails_opts :: [
    datasource: nil | :tranquility | :singularity,
    page: nil | integer,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of kills related to a war

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
      path: "wars/#{war_id}/killmails",
      query_opts: Keyword.take(opts, [:datasource, :page, :user_agent]),
    }
  end

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type war_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return details about a war

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_wars_war_id`
  - `path` -- `/wars/{war_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars_war_id)

  """
  @spec war(war_id :: integer, opts :: war_opts) :: ESI.Request.t
  def war(war_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "wars/#{war_id}",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end
end