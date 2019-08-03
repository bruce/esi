defmodule ESI.API.UI do

  @typedoc """
  Options for [`UI.open_contract_window/1`](#open_contract_window/1).

  - `:contract_id` (REQUIRED) -- The contract to open
  - `:token` -- Access token to use if unable to set a header
  """
  @type open_contract_window_opts :: [open_contract_window_opt]
  @type open_contract_window_opt :: {:contract_id, integer} | {:token, nil | String.t}


  @doc """
  Open the contract window inside the client.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_ui_openwindow_contract`
  - `path` -- `/ui/openwindow/contract/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/User Interface/post_ui_openwindow_contract)

  """
  @spec open_contract_window(opts :: open_contract_window_opts) :: ESI.Request.t
  def open_contract_window(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/contract/",
      opts_schema: %{contract_id: {:query, :required}, datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`UI.set_autopilot_waypoint/1`](#set_autopilot_waypoint/1).

  - `:add_to_beginning` (DEFAULT: `false`) -- Whether this solar system should be added to the beginning of all waypoints
  - `:clear_other_waypoints` (DEFAULT: `false`) -- Whether clean other waypoints beforing adding this one
  - `:destination_id` (REQUIRED) -- The destination to travel to, can be solar system, station or structure's id
  - `:token` -- Access token to use if unable to set a header
  """
  @type set_autopilot_waypoint_opts :: [set_autopilot_waypoint_opt]
  @type set_autopilot_waypoint_opt :: {:add_to_beginning, boolean} | {:clear_other_waypoints, boolean} | {:destination_id, integer} | {:token, nil | String.t}


  @doc """
  Set a solar system as autopilot waypoint.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_ui_autopilot_waypoint`
  - `path` -- `/ui/autopilot/waypoint/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/User Interface/post_ui_autopilot_waypoint)

  """
  @spec set_autopilot_waypoint(opts :: set_autopilot_waypoint_opts) :: ESI.Request.t
  def set_autopilot_waypoint(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/autopilot/waypoint/",
      opts_schema: %{add_to_beginning: {:query, :required}, clear_other_waypoints: {:query, :required}, datasource: {:query, :optional}, destination_id: {:query, :required}, token: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`UI.open_new_mail_window/1`](#open_new_mail_window/1).

  - `:new_mail` (REQUIRED) -- The details of mail to create
  - `:token` -- Access token to use if unable to set a header
  """
  @type open_new_mail_window_opts :: [open_new_mail_window_opt]
  @type open_new_mail_window_opt :: {:new_mail, [body: String.t, recipients: [integer], subject: String.t, to_corp_or_alliance_id: nil | integer, to_mailing_list_id: nil | integer]} | {:token, nil | String.t}


  @doc """
  Open the New Mail window, according to settings from the request if applicable.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_ui_openwindow_newmail`
  - `path` -- `/ui/openwindow/newmail/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/User Interface/post_ui_openwindow_newmail)

  """
  @spec open_new_mail_window(opts :: open_new_mail_window_opts) :: ESI.Request.t
  def open_new_mail_window(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/newmail/",
      opts_schema: %{datasource: {:query, :optional}, new_mail: {:body, :required}, token: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`UI.open_market_details_window/1`](#open_market_details_window/1).

  - `:token` -- Access token to use if unable to set a header
  - `:type_id` (REQUIRED) -- The item type to open in market window
  """
  @type open_market_details_window_opts :: [open_market_details_window_opt]
  @type open_market_details_window_opt :: {:token, nil | String.t} | {:type_id, integer}


  @doc """
  Open the market details window for a specific typeID inside the client.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_ui_openwindow_marketdetails`
  - `path` -- `/ui/openwindow/marketdetails/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/User Interface/post_ui_openwindow_marketdetails)

  """
  @spec open_market_details_window(opts :: open_market_details_window_opts) :: ESI.Request.t
  def open_market_details_window(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/marketdetails/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, type_id: {:query, :required}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`UI.open_information_window/1`](#open_information_window/1).

  - `:target_id` (REQUIRED) -- The target to open
  - `:token` -- Access token to use if unable to set a header
  """
  @type open_information_window_opts :: [open_information_window_opt]
  @type open_information_window_opt :: {:target_id, integer} | {:token, nil | String.t}


  @doc """
  Open the information window for a character, corporation or alliance inside the client.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_ui_openwindow_information`
  - `path` -- `/ui/openwindow/information/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/User Interface/post_ui_openwindow_information)

  """
  @spec open_information_window(opts :: open_information_window_opts) :: ESI.Request.t
  def open_information_window(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/ui/openwindow/information/",
      opts_schema: %{datasource: {:query, :optional}, target_id: {:query, :required}, token: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end