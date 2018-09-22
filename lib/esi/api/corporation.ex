defmodule ESI.API.Corporation do
  @typedoc """
  Options for [`Corporation.wallets/2`](#wallets/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type wallets_opts :: [wallets_opt]
  @type wallets_opt :: {:token, nil | String.t()}

  @doc """
  Get a corporation's wallets.

  ## Response Example

  List of corporation wallets:

      [
        %{"balance" => 123.45, "division" => 1},
        %{"balance" => 123.45, "division" => 2},
        %{"balance" => 123.45, "division" => 3},
        %{"balance" => 123.45, "division" => 4},
        %{"balance" => 123.45, "division" => 5},
        %{"balance" => 123.45, "division" => 6},
        %{"balance" => 123.45, "division" => 7}
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_wallets`
  - `path` -- `/corporations/{corporation_id}/wallets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_corporations_corporation_id_wallets)

  """
  @spec wallets(corporation_id :: integer, opts :: wallets_opts) :: ESI.Request.t()
  def wallets(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/wallets/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.shareholders/2`](#shareholders/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type shareholders_opts :: [shareholders_opt]
  @type shareholders_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return the current shareholders of a corporation..

  ## Response Example

  List of shareholders:

      [
        %{
          "share_count" => 580,
          "shareholder_id" => 98000001,
          "shareholder_type" => "corporation"
        },
        %{
          "share_count" => 20,
          "shareholder_id" => 2112000003,
          "shareholder_type" => "character"
        },
        %{
          "share_count" => 300,
          "shareholder_id" => 2112000004,
          "shareholder_type" => "character"
        },
        %{
          "share_count" => 100,
          "shareholder_id" => 2112000001,
          "shareholder_type" => "character"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_shareholders`
  - `path` -- `/corporations/{corporation_id}/shareholders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_shareholders)

  """
  @spec shareholders(corporation_id :: integer, opts :: shareholders_opts) :: ESI.Request.t()
  def shareholders(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/shareholders/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.orders/2`](#orders/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type orders_opts :: [orders_opt]
  @type orders_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  List open market orders placed on behalf of a corporation.

  ## Response Example

  A list of open market orders:

      [
        %{
          "duration" => 30,
          "escrow" => 45.6,
          "is_buy_order" => true,
          "issued" => "2016-09-03T05:12:25Z",
          "issued_by" => 2112625428,
          "location_id" => 456,
          "min_volume" => 1,
          "order_id" => 123,
          "price" => 33.3,
          "range" => "station",
          "region_id" => 123,
          "type_id" => 456,
          "volume_remain" => 4422,
          "volume_total" => 123456,
          "wallet_division" => 1
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_orders`
  - `path` -- `/corporations/{corporation_id}/orders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_corporations_corporation_id_orders)

  """
  @spec orders(corporation_id :: integer, opts :: orders_opts) :: ESI.Request.t()
  def orders(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/orders/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.medal_issued/2`](#medal_issued/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type medal_issued_opts :: [medal_issued_opt]
  @type medal_issued_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns medals issued by a corporation.

  ## Response Example

  A list of issued medals:

      [
        %{
          "character_id" => 45678,
          "issued_at" => "2017-10-10T14:00:00Z",
          "issuer_id" => 67890,
          "medal_id" => 123,
          "reason" => "Awesome Reason",
          "status" => "private"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_medals_issued`
  - `path` -- `/corporations/{corporation_id}/medals/issued/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_medals_issued)

  """
  @spec medal_issued(corporation_id :: integer, opts :: medal_issued_opts) :: ESI.Request.t()
  def medal_issued(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/medals/issued/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.bookmark_folders/2`](#bookmark_folders/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type bookmark_folders_opts :: [bookmark_folders_opt]
  @type bookmark_folders_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  A list of your corporation's bookmark folders.

  ## Response Example

  List of corporation owned bookmark folders:

      [%{"folder_id" => 5, "name" => "Important Locations"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_bookmarks_folders`
  - `path` -- `/corporations/{corporation_id}/bookmarks/folders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_corporations_corporation_id_bookmarks_folders)

  """
  @spec bookmark_folders(corporation_id :: integer, opts :: bookmark_folders_opts) ::
          ESI.Request.t()
  def bookmark_folders(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/bookmarks/folders/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @doc """
  Get a list of all the alliances a corporation has been a member of.

  ## Response Example

  Alliance history for the given corporation:

      [
        %{
          "alliance_id" => 99000006,
          "is_deleted" => true,
          "record_id" => 23,
          "start_date" => "2016-10-25T14:46:00Z"
        },
        %{"record_id" => 1, "start_date" => "2015-07-06T20:56:00Z"}
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_alliancehistory`
  - `path` -- `/corporations/{corporation_id}/alliancehistory/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_alliancehistory)

  """
  @spec alliance_history(corporation_id :: integer) :: ESI.Request.t()
  def alliance_history(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/alliancehistory/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @doc """
  Public information about a corporation.

  ## Response Example

  Public information about a corporation:

      %{
        "alliance_id" => 434243723,
        "ceo_id" => 180548812,
        "creator_id" => 180548812,
        "date_founded" => "2004-11-28T16:42:51Z",
        "description" => "This is a corporation description, it's basically just a string",
        "member_count" => 656,
        "name" => "C C P",
        "tax_rate" => 0.256,
        "ticker" => "-CCP-",
        "url" => "http://www.eveonline.com"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id`
  - `path` -- `/corporations/{corporation_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id)

  """
  @spec corporation(corporation_id :: integer) :: ESI.Request.t()
  def corporation(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Corporation.contracts/2`](#contracts/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type contracts_opts :: [contracts_opt]
  @type contracts_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns contracts available to a corporation, only if the corporation is issuer, acceptor or assignee. Only returns contracts no older than 30 days, or if the status is "in_progress"..

  ## Response Example

  A list of contracts:

      [
        %{
          "acceptor_id" => 0,
          "assignee_id" => 0,
          "availability" => "public",
          "buyout" => 10000000000.01,
          "contract_id" => 1,
          "date_expired" => "2017-06-13T13:12:32Z",
          "date_issued" => "2017-06-06T13:12:32Z",
          "days_to_complete" => 0,
          "end_location_id" => 60014719,
          "for_corporation" => true,
          "issuer_corporation_id" => 456,
          "issuer_id" => 123,
          "price" => 1000000.01,
          "reward" => 0.01,
          "start_location_id" => 60014719,
          "status" => "outstanding",
          "type" => "auction",
          "volume" => 0.01
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_contracts`
  - `path` -- `/corporations/{corporation_id}/contracts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_corporations_corporation_id_contracts)

  """
  @spec contracts(corporation_id :: integer, opts :: contracts_opts) :: ESI.Request.t()
  def contracts(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/contracts/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.mining_observers/2`](#mining_observers/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type mining_observers_opts :: [mining_observers_opt]
  @type mining_observers_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Paginated list of all entities capable of observing and recording mining for a corporation.

  ## Response Example

  Observer list of a corporation:

      [
        %{
          "last_updated" => "2017-09-19",
          "observer_id" => 1,
          "observer_type" => "structure"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporation_corporation_id_mining_observers`
  - `path` -- `/corporation/{corporation_id}/mining/observers/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_corporation_corporation_id_mining_observers)

  """
  @spec mining_observers(corporation_id :: integer, opts :: mining_observers_opts) ::
          ESI.Request.t()
  def mining_observers(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporation/#{corporation_id}/mining/observers/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.customs_offices/2`](#customs_offices/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type customs_offices_opts :: [customs_offices_opt]
  @type customs_offices_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  List customs offices owned by a corporation.

  ## Response Example

  A list of customs offices and their settings:

      [
        %{
          "alliance_tax_rate" => 0.1,
          "allow_access_with_standings" => true,
          "allow_alliance_access" => false,
          "corporation_tax_rate" => 0.02,
          "excellent_standing_tax_rate" => 0.05,
          "good_standing_tax_rate" => 0.2,
          "neutral_standing_tax_rate" => 0.5,
          "office_id" => 1000000014530,
          "reinforce_exit_end" => 1,
          "reinforce_exit_start" => 23,
          "standing_level" => "neutral",
          "system_id" => 30003657
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_customs_offices`
  - `path` -- `/corporations/{corporation_id}/customs_offices/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_corporations_corporation_id_customs_offices)

  """
  @spec customs_offices(corporation_id :: integer, opts :: customs_offices_opts) ::
          ESI.Request.t()
  def customs_offices(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/customs_offices/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.members/2`](#members/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type members_opts :: [members_opt]
  @type members_opt :: {:token, nil | String.t()}

  @doc """
  Return the current member list of a corporation, the token's character need to be a member of the corporation..

  ## Response Example

  List of member character IDs:

      [90000001, 90000002]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_members`
  - `path` -- `/corporations/{corporation_id}/members/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_members)

  """
  @spec members(corporation_id :: integer, opts :: members_opts) :: ESI.Request.t()
  def members(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/members/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.fw_stats/2`](#fw_stats/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type fw_stats_opts :: [fw_stats_opt]
  @type fw_stats_opt :: {:token, nil | String.t()}

  @doc """
  Statistics about a corporation involved in faction warfare.

  ## Response Example

  Faction warfare statistics for a given corporation:

      %{
        "enlisted_on" => "2017-10-17T00:00:00Z",
        "faction_id" => 500001,
        "kills" => %{"last_week" => 893, "total" => 684350, "yesterday" => 136},
        "pilots" => 28863,
        "victory_points" => %{
          "last_week" => 102640,
          "total" => 52658260,
          "yesterday" => 15980
        }
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_fw_stats`
  - `path` -- `/corporations/{corporation_id}/fw/stats/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_corporations_corporation_id_fw_stats)

  """
  @spec fw_stats(corporation_id :: integer, opts :: fw_stats_opts) :: ESI.Request.t()
  def fw_stats(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/fw/stats/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.assets/2`](#assets/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type assets_opts :: [assets_opt]
  @type assets_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return a list of the corporation assets.

  ## Response Example

  A list of assets:

      [
        %{
          "is_blueprint_copy" => true,
          "is_singleton" => true,
          "item_id" => 1000000016835,
          "location_flag" => "Hangar",
          "location_id" => 60002959,
          "location_type" => "station",
          "quantity" => 1,
          "type_id" => 3516
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_assets`
  - `path` -- `/corporations/{corporation_id}/assets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/get_corporations_corporation_id_assets)

  """
  @spec assets(corporation_id :: integer, opts :: assets_opts) :: ESI.Request.t()
  def assets(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/assets/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.create_asset_names/2`](#create_asset_names/2).

  - `:item_ids` (REQUIRED) -- A list of item ids
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_asset_names_opts :: [create_asset_names_opt]
  @type create_asset_names_opt :: {:item_ids, [nil | integer]} | {:token, nil | String.t()}

  @doc """
  Return names for a set of item ids, which you can get from corporation assets endpoint. Only valid for items that can customize names, like containers or ships.

  ## Response Example

  List of asset names:

      [%{"item_id" => 12345, "name" => "Awesome Name"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_corporations_corporation_id_assets_names`
  - `path` -- `/corporations/{corporation_id}/assets/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/post_corporations_corporation_id_assets_names)

  """
  @spec create_asset_names(corporation_id :: integer, opts :: create_asset_names_opts) ::
          ESI.Request.t()
  def create_asset_names(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/corporations/#{corporation_id}/assets/names/",
      opts_schema: %{
        datasource: {:query, :optional},
        item_ids: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.contact_labels/2`](#contact_labels/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type contact_labels_opts :: [contact_labels_opt]
  @type contact_labels_opt :: {:token, nil | String.t()}

  @doc """
  Return custom labels for a corporation's contacts.

  ## Response Example

  A list of corporation contact labels:

      [%{"label_id" => 2, "label_name" => "Corporation Friends"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_contacts_labels`
  - `path` -- `/corporations/{corporation_id}/contacts/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_corporations_corporation_id_contacts_labels)

  """
  @spec contact_labels(corporation_id :: integer, opts :: contact_labels_opts) :: ESI.Request.t()
  def contact_labels(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/contacts/labels/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.roles/2`](#roles/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type roles_opts :: [roles_opt]
  @type roles_opt :: {:token, nil | String.t()}

  @doc """
  Return the roles of all members if the character has the personnel manager role or any grantable role..

  ## Response Example

  List of member character ID's and roles:

      [%{"character_id" => 1000171, "roles" => ["Director", "Station_Manager"]}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_roles`
  - `path` -- `/corporations/{corporation_id}/roles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_roles)

  """
  @spec roles(corporation_id :: integer, opts :: roles_opts) :: ESI.Request.t()
  def roles(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/roles/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.member_limit/2`](#member_limit/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type member_limit_opts :: [member_limit_opt]
  @type member_limit_opt :: {:token, nil | String.t()}

  @doc """
  Return a corporation's member limit, not including CEO himself.

  ## Response Example

  The corporation's member limit:

      40

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_members_limit`
  - `path` -- `/corporations/{corporation_id}/members/limit/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_members_limit)

  """
  @spec member_limit(corporation_id :: integer, opts :: member_limit_opts) :: ESI.Request.t()
  def member_limit(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/members/limit/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.member_titles/2`](#member_titles/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type member_titles_opts :: [member_titles_opt]
  @type member_titles_opt :: {:token, nil | String.t()}

  @doc """
  Returns a corporation's members' titles.

  ## Response Example

  A list of members and theirs titles:

      [%{"character_id" => 12345, "titles" => []}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_members_titles`
  - `path` -- `/corporations/{corporation_id}/members/titles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_members_titles)

  """
  @spec member_titles(corporation_id :: integer, opts :: member_titles_opts) :: ESI.Request.t()
  def member_titles(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/members/titles/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.contacts/2`](#contacts/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type contacts_opts :: [contacts_opt]
  @type contacts_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return contacts of a corporation.

  ## Response Example

  A list of contacts:

      [
        %{
          "contact_id" => 123,
          "contact_type" => "character",
          "is_watched" => true,
          "standing" => 9.9
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_contacts`
  - `path` -- `/corporations/{corporation_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_corporations_corporation_id_contacts)

  """
  @spec contacts(corporation_id :: integer, opts :: contacts_opts) :: ESI.Request.t()
  def contacts(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/contacts/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.bookmarks/2`](#bookmarks/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type bookmarks_opts :: [bookmarks_opt]
  @type bookmarks_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  A list of your corporation's bookmarks.

  ## Response Example

  List of corporation owned bookmarks:

      [
        %{
          "bookmark_id" => 4,
          "created" => "2016-08-09T11:57:47Z",
          "creator_id" => 2112625428,
          "folder_id" => 5,
          "item" => %{"item_id" => 50006722, "type_id" => 29633},
          "label" => "Stargate",
          "location_id" => 30003430,
          "notes" => "This is a stargate"
        },
        %{
          "bookmark_id" => 5,
          "coordinates" => %{
            "x" => -2958928814000,
            "y" => -338367275823,
            "z" => 2114538075090
          },
          "created" => "2016-08-09T11:57:47Z",
          "creator_id" => 2112625428,
          "folder_id" => 5,
          "label" => "Random location",
          "location_id" => 30003430,
          "notes" => "This is a random location in space"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_bookmarks`
  - `path` -- `/corporations/{corporation_id}/bookmarks/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_corporations_corporation_id_bookmarks)

  """
  @spec bookmarks(corporation_id :: integer, opts :: bookmarks_opts) :: ESI.Request.t()
  def bookmarks(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/bookmarks/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.standings/2`](#standings/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type standings_opts :: [standings_opt]
  @type standings_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return corporation standings from agents, NPC corporations, and factions.

  ## Response Example

  A list of standings:

      [
        %{"from_id" => 3009841, "from_type" => "agent", "standing" => 0.1},
        %{"from_id" => 1000061, "from_type" => "npc_corp", "standing" => 0},
        %{"from_id" => 500003, "from_type" => "faction", "standing" => -1}
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_standings`
  - `path` -- `/corporations/{corporation_id}/standings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_standings)

  """
  @spec standings(corporation_id :: integer, opts :: standings_opts) :: ESI.Request.t()
  def standings(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/standings/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.starbase/3`](#starbase/3).

  - `:system_id` (REQUIRED) -- The solar system this starbase (POS) is located in,
  - `:token` -- Access token to use if unable to set a header
  """
  @type starbase_opts :: [starbase_opt]
  @type starbase_opt :: {:system_id, integer} | {:token, nil | String.t()}

  @doc """
  Returns various settings and fuels of a starbase (POS).

  ## Response Example

  List of starbases (POSes):

      %{
        "allow_alliance_members" => false,
        "allow_corporation_members" => true,
        "anchor" => "config_starbase_equipment_role",
        "attack_if_at_war" => true,
        "attack_if_other_security_status_dropping" => false,
        "fuel_bay_take" => "config_starbase_equipment_role",
        "fuel_bay_view" => "config_starbase_equipment_role",
        "offline" => "config_starbase_equipment_role",
        "online" => "config_starbase_equipment_role",
        "unanchor" => "config_starbase_equipment_role",
        "use_alliance_standings" => false
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_starbases_starbase_id`
  - `path` -- `/corporations/{corporation_id}/starbases/{starbase_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_starbases_starbase_id)

  """
  @spec starbase(corporation_id :: integer, starbase_id :: integer, opts :: starbase_opts) ::
          ESI.Request.t()
  def starbase(corporation_id, starbase_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/starbases/#{starbase_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        system_id: {:query, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.killmail_recent/2`](#killmail_recent/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type killmail_recent_opts :: [killmail_recent_opt]
  @type killmail_recent_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Get a list of a corporation's kills and losses going back 90 days.

  ## Response Example

  A list of killmail IDs and hashes:

      [
        %{
          "killmail_hash" => "8eef5e8fb6b88fe3407c489df33822b2e3b57a5e",
          "killmail_id" => 2
        },
        %{
          "killmail_hash" => "b41ccb498ece33d64019f64c0db392aa3aa701fb",
          "killmail_id" => 1
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_killmails_recent`
  - `path` -- `/corporations/{corporation_id}/killmails/recent/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Killmails/get_corporations_corporation_id_killmails_recent)

  """
  @spec killmail_recent(corporation_id :: integer, opts :: killmail_recent_opts) ::
          ESI.Request.t()
  def killmail_recent(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/killmails/recent/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.create_asset_locations/2`](#create_asset_locations/2).

  - `:item_ids` (REQUIRED) -- A list of item ids
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_asset_locations_opts :: [create_asset_locations_opt]
  @type create_asset_locations_opt :: {:item_ids, [nil | integer]} | {:token, nil | String.t()}

  @doc """
  Return locations for a set of item ids, which you can get from corporation assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0).

  ## Response Example

  List of asset locations:

      [%{"item_id" => 12345, "position" => %{"x" => 1.2, "y" => 2.3, "z" => -3.4}}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_corporations_corporation_id_assets_locations`
  - `path` -- `/corporations/{corporation_id}/assets/locations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/post_corporations_corporation_id_assets_locations)

  """
  @spec create_asset_locations(corporation_id :: integer, opts :: create_asset_locations_opts) ::
          ESI.Request.t()
  def create_asset_locations(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/corporations/#{corporation_id}/assets/locations/",
      opts_schema: %{
        datasource: {:query, :optional},
        item_ids: {:body, :required},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.facilities/2`](#facilities/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type facilities_opts :: [facilities_opt]
  @type facilities_opt :: {:token, nil | String.t()}

  @doc """
  Return a corporation's facilities.

  ## Response Example

  List of corporation facilities:

      [%{"facility_id" => 123, "system_id" => 45678, "type_id" => 2502}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_facilities`
  - `path` -- `/corporations/{corporation_id}/facilities/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_facilities)

  """
  @spec facilities(corporation_id :: integer, opts :: facilities_opts) :: ESI.Request.t()
  def facilities(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/facilities/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.structures/2`](#structures/2).

  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response, takes precedence over Accept-Language
  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type structures_opts :: [structures_opt]
  @type structures_opt ::
          {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}
          | {:page, nil | integer}
          | {:token, nil | String.t()}

  @doc """
  Get a list of corporation structures. This route's version includes the changes to structures detailed in this blog: https://www.eveonline.com/article/upwell-2.0-structures-changes-coming-on-february-13th.

  ## Response Example

  List of corporation structures' information:

      [
        %{
          "corporation_id" => 667531913,
          "profile_id" => 11237,
          "reinforce_hour" => 22,
          "reinforce_weekday" => 2,
          "state" => "shield_vulnerable",
          "structure_id" => 1021975535893,
          "system_id" => 30004763,
          "type_id" => 35833
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_structures`
  - `path` -- `/corporations/{corporation_id}/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_structures)

  """
  @spec structures(corporation_id :: integer, opts :: structures_opts) :: ESI.Request.t()
  def structures(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/structures/",
      opts_schema: %{
        datasource: {:query, :optional},
        language: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.starbases/2`](#starbases/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type starbases_opts :: [starbases_opt]
  @type starbases_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns list of corporation starbases (POSes).

  ## Response Example

  List of starbases (POSes):

      [%{"starbase_id" => 12345, "system_id" => 123456, "type_id" => 456}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_starbases`
  - `path` -- `/corporations/{corporation_id}/starbases/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_starbases)

  """
  @spec starbases(corporation_id :: integer, opts :: starbases_opts) :: ESI.Request.t()
  def starbases(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/starbases/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.container_logs/2`](#container_logs/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type container_logs_opts :: [container_logs_opt]
  @type container_logs_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns logs recorded in the past seven days from all audit log secure containers (ALSC) owned by a given corporation.

  ## Response Example

  List of corporation ALSC logs:

      [
        %{
          "action" => "set_password",
          "character_id" => 2112625428,
          "container_id" => 1000000012279,
          "container_type_id" => 17365,
          "location_flag" => "CorpSAG1",
          "location_id" => 1000000012278,
          "logged_at" => "2017-10-10T14:00:00Z",
          "password_type" => "general"
        },
        %{
          "action" => "lock",
          "character_id" => 2112625428,
          "container_id" => 1000000012279,
          "container_type_id" => 17365,
          "location_flag" => "CorpSAG1",
          "location_id" => 1000000012278,
          "logged_at" => "2017-10-11T12:04:33Z",
          "quantity" => 30,
          "type_id" => 1230
        },
        %{
          "action" => "configure",
          "character_id" => 2112625428,
          "container_id" => 1000000012279,
          "container_type_id" => 17365,
          "location_flag" => "CorpSAG2",
          "location_id" => 1000000012278,
          "logged_at" => "2017-10-11T12:06:29Z",
          "new_config_bitmask" => 31,
          "old_config_bitmask" => 23
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_containers_logs`
  - `path` -- `/corporations/{corporation_id}/containers/logs/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_containers_logs)

  """
  @spec container_logs(corporation_id :: integer, opts :: container_logs_opts) :: ESI.Request.t()
  def container_logs(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/containers/logs/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.transactions/3`](#transactions/3).

  - `:from_id` -- Only show journal entries happened before the transaction referenced by this id
  - `:token` -- Access token to use if unable to set a header
  """
  @type transactions_opts :: [transactions_opt]
  @type transactions_opt :: {:from_id, nil | integer} | {:token, nil | String.t()}

  @doc """
  Get wallet transactions of a corporation.

  ## Response Example

  Wallet transactions:

      [
        %{
          "client_id" => 54321,
          "date" => "2016-10-24T09:00:00Z",
          "is_buy" => true,
          "journal_ref_id" => 67890,
          "location_id" => 60014719,
          "quantity" => 1,
          "transaction_id" => 1234567890,
          "type_id" => 587,
          "unit_price" => 1
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_wallets_division_transactions`
  - `path` -- `/corporations/{corporation_id}/wallets/{division}/transactions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_corporations_corporation_id_wallets_division_transactions)

  """
  @spec transactions(corporation_id :: integer, division :: integer, opts :: transactions_opts) ::
          ESI.Request.t()
  def transactions(corporation_id, division, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/wallets/#{division}/transactions/",
      opts_schema: %{
        datasource: {:query, :optional},
        from_id: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.medals/2`](#medals/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type medals_opts :: [medals_opt]
  @type medals_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns a corporation's medals.

  ## Response Example

  A list of medals:

      [
        %{
          "created_at" => "2017-10-10T14:00:00Z",
          "creator_id" => 46578,
          "description" => "An Awesome Medal",
          "medal_id" => 123,
          "title" => "Awesome Medal"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_medals`
  - `path` -- `/corporations/{corporation_id}/medals/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_medals)

  """
  @spec medals(corporation_id :: integer, opts :: medals_opts) :: ESI.Request.t()
  def medals(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/medals/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.mining_observer/3`](#mining_observer/3).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type mining_observer_opts :: [mining_observer_opt]
  @type mining_observer_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Paginated record of all mining seen by an observer.

  ## Response Example

  Mining ledger of an observer:

      [
        %{
          "character_id" => 95465499,
          "last_updated" => "2017-09-19",
          "quantity" => 500,
          "recorded_corporation_id" => 109299958,
          "type_id" => 1230
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporation_corporation_id_mining_observers_observer_id`
  - `path` -- `/corporation/{corporation_id}/mining/observers/{observer_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_corporation_corporation_id_mining_observers_observer_id)

  """
  @spec mining_observer(
          corporation_id :: integer,
          observer_id :: integer,
          opts :: mining_observer_opts
        ) :: ESI.Request.t()
  def mining_observer(corporation_id, observer_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporation/#{corporation_id}/mining/observers/#{observer_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.titles/2`](#titles/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type titles_opts :: [titles_opt]
  @type titles_opt :: {:token, nil | String.t()}

  @doc """
  Returns a corporation's titles.

  ## Response Example

  A list of titles:

      [
        %{
          "name" => "Awesome Title",
          "roles" => ["Hangar_Take_6", "Hangar_Query_2"],
          "title_id" => 1
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_titles`
  - `path` -- `/corporations/{corporation_id}/titles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_titles)

  """
  @spec titles(corporation_id :: integer, opts :: titles_opts) :: ESI.Request.t()
  def titles(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/titles/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.journal/3`](#journal/3).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type journal_opts :: [journal_opt]
  @type journal_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Retrieve the given corporation's wallet journal for the given division going 30 days back.

  ## Response Example

  Journal entries:

      [
        %{
          "amount" => -1000,
          "balance" => 1.0e5,
          "context_id" => 2112625428,
          "context_id_type" => "character_id",
          "date" => "2016-10-24T09:00:00Z",
          "description" => "CCP Zoetrope transferred cash from C C P's corporate account to CCP SnowedIn's account",
          "first_party_id" => 109299958,
          "id" => 1234567890,
          "ref_type" => "corporation_account_withdrawal",
          "second_party_id" => 95538921
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_wallets_division_journal`
  - `path` -- `/corporations/{corporation_id}/wallets/{division}/journal/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_corporations_corporation_id_wallets_division_journal)

  """
  @spec journal(corporation_id :: integer, division :: integer, opts :: journal_opts) ::
          ESI.Request.t()
  def journal(corporation_id, division, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/wallets/#{division}/journal/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.role_history/2`](#role_history/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type role_history_opts :: [role_history_opt]
  @type role_history_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return how roles have changed for a coporation's members, up to a month.

  ## Response Example

  List of role changes:

      [
        %{
          "changed_at" => "2016-10-25T14:46:00Z",
          "character_id" => 12345,
          "issuer_id" => 45678,
          "new_roles" => ["Station_Manager"],
          "old_roles" => ["Diplomat"],
          "role_type" => "roles"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_roles_history`
  - `path` -- `/corporations/{corporation_id}/roles/history/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_roles_history)

  """
  @spec role_history(corporation_id :: integer, opts :: role_history_opts) :: ESI.Request.t()
  def role_history(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/roles/history/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.industry_jobs/2`](#industry_jobs/2).

  - `:include_completed` (DEFAULT: `false`) -- Whether to retrieve completed corporation industry jobs. Only includes jobs from the past 90 days
  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type industry_jobs_opts :: [industry_jobs_opt]
  @type industry_jobs_opt ::
          {:include_completed, nil | boolean}
          | {:page, nil | integer}
          | {:token, nil | String.t()}

  @doc """
  List industry jobs run by a corporation.

  ## Response Example

  A list of corporation industry jobs:

      [
        %{
          "activity_id" => 1,
          "blueprint_id" => 1015116533326,
          "blueprint_location_id" => 60006382,
          "blueprint_type_id" => 2047,
          "cost" => 118.01,
          "duration" => 548,
          "end_date" => "2014-07-19T15:56:14Z",
          "facility_id" => 60006382,
          "installer_id" => 498338451,
          "job_id" => 229136101,
          "licensed_runs" => 200,
          "location_id" => 60006382,
          "output_location_id" => 60006382,
          "runs" => 1,
          "start_date" => "2014-07-19T15:47:06Z",
          "status" => "active"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_industry_jobs`
  - `path` -- `/corporations/{corporation_id}/industry/jobs/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_corporations_corporation_id_industry_jobs)

  """
  @spec industry_jobs(corporation_id :: integer, opts :: industry_jobs_opts) :: ESI.Request.t()
  def industry_jobs(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/industry/jobs/",
      opts_schema: %{
        datasource: {:query, :optional},
        include_completed: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.blueprints/2`](#blueprints/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type blueprints_opts :: [blueprints_opt]
  @type blueprints_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns a list of blueprints the corporation owns.

  ## Response Example

  List of corporation blueprints:

      [
        %{
          "item_id" => 1000000010495,
          "location_flag" => "CorpSAG1",
          "location_id" => 60014719,
          "material_efficiency" => 0,
          "quantity" => 1,
          "runs" => -1,
          "time_efficiency" => 0,
          "type_id" => 691
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_blueprints`
  - `path` -- `/corporations/{corporation_id}/blueprints/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_blueprints)

  """
  @spec blueprints(corporation_id :: integer, opts :: blueprints_opts) :: ESI.Request.t()
  def blueprints(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/blueprints/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.divisions/2`](#divisions/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type divisions_opts :: [divisions_opt]
  @type divisions_opt :: {:token, nil | String.t()}

  @doc """
  Return corporation hangar and wallet division names, only show if a division is not using the default name.

  ## Response Example

  List of corporation division names:

      %{
        "hangar" => [%{"division" => 1, "name" => "Awesome Hangar 1"}],
        "wallet" => [%{"division" => 1, "name" => "Rich Wallet 1"}]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_divisions`
  - `path` -- `/corporations/{corporation_id}/divisions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_divisions)

  """
  @spec divisions(corporation_id :: integer, opts :: divisions_opts) :: ESI.Request.t()
  def divisions(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/divisions/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @doc """
  Get the icon urls for a corporation.

  ## Response Example

  Urls for icons for the given corporation id and server:

      %{
        "px128x128" => "https://imageserver.eveonline.com/Corporation/1000010_128.png",
        "px256x256" => "https://imageserver.eveonline.com/Corporation/1000010_256.png",
        "px64x64" => "https://imageserver.eveonline.com/Corporation/1000010_64.png"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_icons`
  - `path` -- `/corporations/{corporation_id}/icons/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_icons)

  """
  @spec icons(corporation_id :: integer) :: ESI.Request.t()
  def icons(corporation_id) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/icons/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Corporation.membertracking/2`](#membertracking/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type membertracking_opts :: [membertracking_opt]
  @type membertracking_opt :: {:token, nil | String.t()}

  @doc """
  Returns additional information about a corporation's members which helps tracking their activities.

  ## Response Example

  List of member character IDs:

      [
        %{
          "character_id" => 2112000001,
          "location_id" => 30003657,
          "logoff_date" => "2017-08-03T14:31:16Z",
          "logon_date" => "2017-08-03T14:22:03Z",
          "ship_type_id" => 22464,
          "start_date" => "2017-07-10T14:46:00Z"
        },
        %{
          "character_id" => 2112000002,
          "location_id" => 30003657,
          "logoff_date" => "2017-07-25T11:07:40Z",
          "logon_date" => "2017-07-25T10:54:00Z",
          "ship_type_id" => 670,
          "start_date" => "2017-07-10T14:50:00Z"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_membertracking`
  - `path` -- `/corporations/{corporation_id}/membertracking/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_corporation_id_membertracking)

  """
  @spec membertracking(corporation_id :: integer, opts :: membertracking_opts) :: ESI.Request.t()
  def membertracking(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/membertracking/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.mining_extractions/2`](#mining_extractions/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type mining_extractions_opts :: [mining_extractions_opt]
  @type mining_extractions_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Extraction timers for all moon chunks being extracted by refineries belonging to a corporation..

  ## Response Example

  A list of chunk timers:

      [
        %{
          "chunk_arrival_time" => "2017-10-17T11:00:59Z",
          "extraction_start_time" => "2017-10-11T10:37:04Z",
          "moon_id" => 40307229,
          "natural_decay_time" => "2017-10-17T14:00:59Z",
          "structure_id" => 1000000010579
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporation_corporation_id_mining_extractions`
  - `path` -- `/corporation/{corporation_id}/mining/extractions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_corporation_corporation_id_mining_extractions)

  """
  @spec mining_extractions(corporation_id :: integer, opts :: mining_extractions_opts) ::
          ESI.Request.t()
  def mining_extractions(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporation/#{corporation_id}/mining/extractions/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.items/3`](#items/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type items_opts :: [items_opt]
  @type items_opt :: {:token, nil | String.t()}

  @doc """
  Lists items of a particular contract.

  ## Response Example

  A list of items in this contract:

      [
        %{
          "is_included" => true,
          "is_singleton" => false,
          "quantity" => 1,
          "record_id" => 123456,
          "type_id" => 587
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_contracts_contract_id_items`
  - `path` -- `/corporations/{corporation_id}/contracts/{contract_id}/items/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_corporations_corporation_id_contracts_contract_id_items)

  """
  @spec items(corporation_id :: integer, contract_id :: integer, opts :: items_opts) ::
          ESI.Request.t()
  def items(corporation_id, contract_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/contracts/#{contract_id}/items/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}},
      opts: Map.new(opts)
    }
  end

  @doc """
  Get a list of npc corporations.

  ## Response Example

  A list of npc corporation ids:

      [1000001, 1000002, 1000003]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_npccorps`
  - `path` -- `/corporations/npccorps/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Corporation/get_corporations_npccorps)

  """
  @spec npccorps() :: ESI.Request.t()
  def npccorps() do
    %ESI.Request{
      verb: :get,
      path: "/corporations/npccorps/",
      opts_schema: %{datasource: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Corporation.order_history/2`](#order_history/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type order_history_opts :: [order_history_opt]
  @type order_history_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  List cancelled and expired market orders placed on behalf of a corporation up to 90 days in the past..

  ## Response Example

  Expired and cancelled market orders placed on behalf of a corporation:

      [
        %{
          "duration" => 30,
          "escrow" => 45.6,
          "is_buy_order" => true,
          "issued" => "2016-09-03T05:12:25Z",
          "issued_by" => 2112625428,
          "location_id" => 456,
          "min_volume" => 1,
          "order_id" => 123,
          "price" => 33.3,
          "range" => "station",
          "region_id" => 123,
          "state" => "expired",
          "type_id" => 456,
          "volume_remain" => 4422,
          "volume_total" => 123456,
          "wallet_division" => 1
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_orders_history`
  - `path` -- `/corporations/{corporation_id}/orders/history/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_corporations_corporation_id_orders_history)

  """
  @spec order_history(corporation_id :: integer, opts :: order_history_opts) :: ESI.Request.t()
  def order_history(corporation_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/orders/history/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Corporation.bids/3`](#bids/3).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type bids_opts :: [bids_opt]
  @type bids_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Lists bids on a particular auction contract.

  ## Response Example

  A list of bids:

      [
        %{
          "amount" => 1.23,
          "bid_id" => 1,
          "bidder_id" => 123,
          "date_bid" => "2017-01-01T10:10:10Z"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_corporations_corporation_id_contracts_contract_id_bids`
  - `path` -- `/corporations/{corporation_id}/contracts/{contract_id}/bids/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_corporations_corporation_id_contracts_contract_id_bids)

  """
  @spec bids(corporation_id :: integer, contract_id :: integer, opts :: bids_opts) ::
          ESI.Request.t()
  def bids(corporation_id, contract_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/corporations/#{corporation_id}/contracts/#{contract_id}/bids/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end
end
