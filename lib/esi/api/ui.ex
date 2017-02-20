defmodule ESI.API.UI do

  @doc """
  Open the information window for a character, corporation or alliance inside the client

  ## Swagger

  The Swagger Operation ID for this function is `post_ui_openwindow_information`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:target_id` (REQUIRED) -- The target to open
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_openwindow_information_opts :: [
    datasource: nil | :tranquility | :singularity,
    target_id: integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word]
  @spec create_openwindow_information(opts :: create_openwindow_information_opts) :: ESI.Request.t
  def create_openwindow_information(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/information/",
      query_opts: Keyword.take(opts, [:datasource, :target_id, :token, :user_agent]),
    }
  end

  @doc """
  Open the market details window for a specific typeID inside the client

  ## Swagger

  The Swagger Operation ID for this function is `post_ui_openwindow_marketdetails`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:type_id` (REQUIRED) -- The item type to open in market window
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_openwindow_marketdetail_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    type_id: integer,
    user_agent: nil | String.t,
  ]
  # [:word, :word]
  @spec create_openwindow_marketdetail(opts :: create_openwindow_marketdetail_opts) :: ESI.Request.t
  def create_openwindow_marketdetail(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/marketdetails/",
      query_opts: Keyword.take(opts, [:datasource, :token, :type_id, :user_agent]),
    }
  end

  @doc """
  Open the New Mail window, according to settings from the request if applicable

  ## Swagger

  The Swagger Operation ID for this function is `post_ui_openwindow_newmail`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:new_mail` (REQUIRED) -- The details of mail to create
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_openwindow_newmail_opts :: [
    datasource: nil | :tranquility | :singularity,
    new_mail: [body: nil | String.t, recipients: nil | [nil | integer], subject: nil | String.t, to_corp_or_alliance_id: nil | integer, to_mailing_list_id: nil | integer],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word]
  @spec create_openwindow_newmail(opts :: create_openwindow_newmail_opts) :: ESI.Request.t
  def create_openwindow_newmail(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/newmail/",
      body_opts: Keyword.take(opts, [:new_mail]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Set a solar system as autopilot waypoint

  ## Swagger

  The Swagger Operation ID for this function is `post_ui_autopilot_waypoint`

  ## Options

  - `:add_to_beginning` (DEFAULT: `false`) -- Whether this solar system should be added to the beginning of all waypoints
  - `:clear_other_waypoints` (DEFAULT: `false`) -- Whether clean other waypoints beforing adding this one
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:destination_id` (REQUIRED) -- The destination to travel to, can be solar system, station or structure's id
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_autopilot_waypoint_opts :: [
    add_to_beginning: boolean,
    clear_other_waypoints: boolean,
    datasource: nil | :tranquility | :singularity,
    destination_id: integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word]
  @spec create_autopilot_waypoint(opts :: create_autopilot_waypoint_opts) :: ESI.Request.t
  def create_autopilot_waypoint(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/autopilot/waypoint/",
      query_opts: Keyword.take(opts, [:add_to_beginning, :clear_other_waypoints, :datasource, :destination_id, :token, :user_agent]),
    }
  end

  @doc """
  Open the contract window inside the client

  ## Swagger

  The Swagger Operation ID for this function is `post_ui_openwindow_contract`

  ## Options

  - `:contract_id` (REQUIRED) -- The contract to open
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_openwindow_contract_opts :: [
    contract_id: integer,
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word]
  @spec create_openwindow_contract(opts :: create_openwindow_contract_opts) :: ESI.Request.t
  def create_openwindow_contract(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/contract/",
      query_opts: Keyword.take(opts, [:contract_id, :datasource, :token, :user_agent]),
    }
  end
end