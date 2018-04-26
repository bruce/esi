defmodule ESI.API.Character do
  @typedoc """
  Options for [`Character.bookmarks/2`](#bookmarks/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type bookmarks_opts :: [bookmarks_opt]
  @type bookmarks_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  A list of your character's personal bookmarks.

  ## Response Example

  A list of bookmarks:

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

  - `operationId` -- `get_characters_character_id_bookmarks`
  - `path` -- `/characters/{character_id}/bookmarks/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_characters_character_id_bookmarks)

  """
  @spec bookmarks(character_id :: integer, opts :: bookmarks_opts) :: ESI.Request.t()
  def bookmarks(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.fittings/2`](#fittings/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type fittings_opts :: [fittings_opt]
  @type fittings_opt :: {:token, nil | String.t()}

  @doc """
  Return fittings of a character.

  ## Response Example

  A list of fittings:

      [
        %{
          "description" => "Awesome Vindi fitting",
          "fitting_id" => 1,
          "items" => [%{"flag" => 12, "quantity" => 1, "type_id" => 1234}],
          "name" => "Best Vindicator",
          "ship_type_id" => 123
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_fittings`
  - `path` -- `/characters/{character_id}/fittings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/get_characters_character_id_fittings)

  """
  @spec fittings(character_id :: integer, opts :: fittings_opts) :: ESI.Request.t()
  def fittings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fittings/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_fittings/2`](#create_fittings/2).

  - `:fitting` (REQUIRED) -- Details about the new fitting
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_fittings_opts :: [create_fittings_opt]
  @type create_fittings_opt ::
          {:fitting,
           [
             description: String.t(),
             items: [[flag: integer, quantity: integer, type_id: integer]],
             name: String.t(),
             ship_type_id: integer
           ]}
          | {:token, nil | String.t()}

  @doc """
  Save a new fitting for a character.

  ## Response Example

  A list of fittings:

      %{"fitting_id" => 2}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_fittings`
  - `path` -- `/characters/{character_id}/fittings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/post_characters_character_id_fittings)

  """
  @spec create_fittings(character_id :: integer, opts :: create_fittings_opts) :: ESI.Request.t()
  def create_fittings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/fittings/",
      opts_schema: %{
        datasource: {:query, :optional},
        fitting: {:body, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.contracts/2`](#contracts/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type contracts_opts :: [contracts_opt]
  @type contracts_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Returns contracts available to a character, only if the character is issuer, acceptor or assignee. Only returns contracts no older than 30 days, or if the status is "in_progress"..

  ## Response Example

  A list of contracts:

      [
        %{
          "acceptor_id" => 0,
          "assignee_id" => 0,
          "availability" => "public",
          "buyout" => 10000000000.01,
          "contract_id" => 1,
          "date_accepted" => "2017-06-06T13:12:32Z",
          "date_completed" => "2017-06-06T13:12:32Z",
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

  - `operationId` -- `get_characters_character_id_contracts`
  - `path` -- `/characters/{character_id}/contracts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_characters_character_id_contracts)

  """
  @spec contracts(character_id :: integer, opts :: contracts_opts) :: ESI.Request.t()
  def contracts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contracts/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.ship/2`](#ship/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type ship_opts :: [ship_opt]
  @type ship_opt :: {:token, nil | String.t()}

  @doc """
  Get the current ship type, name and id.

  ## Response Example

  Get the current ship type, name and id:

      %{
        "ship_item_id" => 1000000016991,
        "ship_name" => "SPACESHIPS!!!",
        "ship_type_id" => 1233
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_ship`
  - `path` -- `/characters/{character_id}/ship/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Location/get_characters_character_id_ship)

  """
  @spec ship(character_id :: integer, opts :: ship_opts) :: ESI.Request.t()
  def ship(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/ship/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.search/2`](#search/2).

  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:language` (DEFAULT: `:"en-us"`) -- Language to use in the response
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  - `:token` -- Access token to use if unable to set a header
  """
  @type search_opts :: [search_opt]
  @type search_opt ::
          {:categories,
           [
             :agent
             | :alliance
             | :character
             | :constellation
             | :corporation
             | :faction
             | :inventory_type
             | :region
             | :solar_system
             | :station
             | :structure
           ]}
          | {:language, nil | :de | :"en-us" | :fr | :ja | :ru | :zh}
          | {:search, String.t()}
          | {:strict, nil | boolean}
          | {:token, nil | String.t()}

  @doc """
  Search for entities that match a given sub-string..

  ## Response Example

  A list of search results:

      %{
        "solar_system" => [30002510],
        "station" => [60004588, 60004594, 60005725, 60009106, 60012721, 60012724,
         60012727]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_search`
  - `path` -- `/characters/{character_id}/search/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Search/get_characters_character_id_search)

  """
  @spec search(character_id :: integer, opts :: search_opts) :: ESI.Request.t()
  def search(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/search/",
      opts_schema: %{
        categories: {:query, :required},
        datasource: {:query, :optional},
        language: {:query, :optional},
        search: {:query, :required},
        strict: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.names/1`](#names/1).

  - `:character_ids` (REQUIRED) -- A comma separated list of character IDs
  """
  @type names_opts :: [names_opt]
  @type names_opt :: {:character_ids, [integer]}

  @doc """
  Resolve a set of character IDs to character names.

  ## Response Example

  List of id/name associations:

      [%{"character_id" => 95465499, "character_name" => "CCP Bartender"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_names`
  - `path` -- `/characters/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_names)

  """
  @spec names(opts :: names_opts) :: ESI.Request.t()
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/names/",
      opts_schema: %{
        character_ids: {:query, :required},
        datasource: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.delete_mail_label/3`](#delete_mail_label/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_mail_label_opts :: [delete_mail_label_opt]
  @type delete_mail_label_opt :: {:token, nil | String.t()}

  @doc """
  Delete a mail label.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_mail_labels_label_id`
  - `path` -- `/characters/{character_id}/mail/labels/{label_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/delete_characters_character_id_mail_labels_label_id)

  """
  @spec delete_mail_label(
          character_id :: integer,
          label_id :: integer,
          opts :: delete_mail_label_opts
        ) :: ESI.Request.t()
  def delete_mail_label(character_id, label_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/labels/#{label_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.bookmark_folders/2`](#bookmark_folders/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type bookmark_folders_opts :: [bookmark_folders_opt]
  @type bookmark_folders_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  A list of your character's personal bookmark folders.

  ## Response Example

  List of bookmark folders:

      [%{"folder_id" => 5, "name" => "Icecream"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_bookmarks_folders`
  - `path` -- `/characters/{character_id}/bookmarks/folders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_characters_character_id_bookmarks_folders)

  """
  @spec bookmark_folders(character_id :: integer, opts :: bookmark_folders_opts) ::
          ESI.Request.t()
  def bookmark_folders(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/folders/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.assets/2`](#assets/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type assets_opts :: [assets_opt]
  @type assets_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return a list of the characters assets.

  ## Response Example

  A flat list of the users assets:

      [
        %{
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

  - `operationId` -- `get_characters_character_id_assets`
  - `path` -- `/characters/{character_id}/assets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/get_characters_character_id_assets)

  """
  @spec assets(character_id :: integer, opts :: assets_opts) :: ESI.Request.t()
  def assets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/assets/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.skillqueue/2`](#skillqueue/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type skillqueue_opts :: [skillqueue_opt]
  @type skillqueue_opt :: {:token, nil | String.t()}

  @doc """
  List the configured skill queue for the given character.

  ## Response Example

  The current skill queue, sorted ascending by finishing time:

      [
        %{
          "finish_date" => "2016-06-29T10:47:00Z",
          "finished_level" => 3,
          "queue_position" => 0,
          "skill_id" => 1,
          "start_date" => "2016-06-29T10:46:00Z"
        },
        %{
          "finish_date" => "2016-07-15T10:47:00Z",
          "finished_level" => 4,
          "queue_position" => 1,
          "skill_id" => 1,
          "start_date" => "2016-06-29T10:47:00Z"
        },
        %{
          "finish_date" => "2016-08-30T10:47:00Z",
          "finished_level" => 2,
          "queue_position" => 2,
          "skill_id" => 2,
          "start_date" => "2016-07-15T10:47:00Z"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_skillqueue`
  - `path` -- `/characters/{character_id}/skillqueue/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_skillqueue)

  """
  @spec skillqueue(character_id :: integer, opts :: skillqueue_opts) :: ESI.Request.t()
  def skillqueue(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skillqueue/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.fatigue/2`](#fatigue/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type fatigue_opts :: [fatigue_opt]
  @type fatigue_opt :: {:token, nil | String.t()}

  @doc """
  Return a character's jump activation and fatigue information.

  ## Response Example

  Jump activation and fatigue information:

      %{
        "jump_fatigue_expire_date" => "2017-07-06T15:47:00Z",
        "last_jump_date" => "2017-07-05T15:47:00Z",
        "last_update_date" => "2017-07-05T15:42:00Z"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_fatigue`
  - `path` -- `/characters/{character_id}/fatigue/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_fatigue)

  """
  @spec fatigue(character_id :: integer, opts :: fatigue_opts) :: ESI.Request.t()
  def fatigue(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fatigue/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.wallet_transactions/2`](#wallet_transactions/2).

  - `:from_id` -- Only show transactions happened before the one referenced by this id
  - `:token` -- Access token to use if unable to set a header
  """
  @type wallet_transactions_opts :: [wallet_transactions_opt]
  @type wallet_transactions_opt :: {:from_id, nil | integer} | {:token, nil | String.t()}

  @doc """
  Get wallet transactions of a character.

  ## Response Example

  Wallet transactions:

      [
        %{
          "client_id" => 54321,
          "date" => "2016-10-24T09:00:00Z",
          "is_buy" => true,
          "is_personal" => true,
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

  - `operationId` -- `get_characters_character_id_wallet_transactions`
  - `path` -- `/characters/{character_id}/wallet/transactions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_characters_character_id_wallet_transactions)

  """
  @spec wallet_transactions(character_id :: integer, opts :: wallet_transactions_opts) ::
          ESI.Request.t()
  def wallet_transactions(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/wallet/transactions/",
      opts_schema: %{
        datasource: {:query, :optional},
        from_id: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @doc """
  Public information about a character.

  ## Response Example

  Public data for the given character:

      %{
        "ancestry_id" => 19,
        "birthday" => "2015-03-24T11:37:00Z",
        "bloodline_id" => 3,
        "corporation_id" => 109299958,
        "description" => "",
        "gender" => "male",
        "name" => "CCP Bartender",
        "race_id" => 2
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id`
  - `path` -- `/characters/{character_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id)

  """
  @spec character(character_id :: integer) :: ESI.Request.t()
  def character(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Character.attributes/2`](#attributes/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type attributes_opts :: [attributes_opt]
  @type attributes_opt :: {:token, nil | String.t()}

  @doc """
  Return attributes of a character.

  ## Response Example

  Attributes of a character:

      %{
        "charisma" => 20,
        "intelligence" => 20,
        "memory" => 20,
        "perception" => 20,
        "willpower" => 20
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_attributes`
  - `path` -- `/characters/{character_id}/attributes/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_attributes)

  """
  @spec attributes(character_id :: integer, opts :: attributes_opts) :: ESI.Request.t()
  def attributes(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/attributes/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.online/2`](#online/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type online_opts :: [online_opt]
  @type online_opt :: {:token, nil | String.t()}

  @doc """
  Checks if the character is currently online.

  ## Response Example

  Object describing the character's online status:

      %{
        "last_login" => "2017-01-02T03:04:05Z",
        "last_logout" => "2017-01-02T04:05:06Z",
        "logins" => 9001,
        "online" => true
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_online`
  - `path` -- `/characters/{character_id}/online/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Location/get_characters_character_id_online)

  """
  @spec online(character_id :: integer, opts :: online_opts) :: ESI.Request.t()
  def online(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/online/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.planets/2`](#planets/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type planets_opts :: [planets_opt]
  @type planets_opt :: {:token, nil | String.t()}

  @doc """
  Returns a list of all planetary colonies owned by a character..

  ## Response Example

  List of colonies:

      [
        %{
          "last_update" => "2016-11-28T16:42:51Z",
          "num_pins" => 1,
          "owner_id" => 90000001,
          "planet_id" => 40023691,
          "planet_type" => "plasma",
          "solar_system_id" => 30000379,
          "upgrade_level" => 0
        },
        %{
          "last_update" => "2016-11-28T16:41:54Z",
          "num_pins" => 1,
          "owner_id" => 90000001,
          "planet_id" => 40023697,
          "planet_type" => "barren",
          "solar_system_id" => 30000379,
          "upgrade_level" => 0
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_planets`
  - `path` -- `/characters/{character_id}/planets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_characters_character_id_planets)

  """
  @spec planets(character_id :: integer, opts :: planets_opts) :: ESI.Request.t()
  def planets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.roles/2`](#roles/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type roles_opts :: [roles_opt]
  @type roles_opt :: {:token, nil | String.t()}

  @doc """
  Returns a character's corporation roles.

  ## Response Example

  The character's roles in thier corporation:

      %{"roles" => ["Director", "Station_Manager"]}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_roles`
  - `path` -- `/characters/{character_id}/roles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_roles)

  """
  @spec roles(character_id :: integer, opts :: roles_opts) :: ESI.Request.t()
  def roles(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/roles/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_cspa/2`](#create_cspa/2).

  - `:characters` (REQUIRED) -- The target characters to calculate the charge for
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_cspa_opts :: [create_cspa_opt]
  @type create_cspa_opt :: {:characters, [nil | integer]} | {:token, nil | String.t()}

  @doc """
  Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost.

  ## Response Example

  Aggregate cost of sending a mail from the source character to the target characters, in ISK:

      2950.0

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_cspa`
  - `path` -- `/characters/{character_id}/cspa/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/post_characters_character_id_cspa)

  """
  @spec create_cspa(character_id :: integer, opts :: create_cspa_opts) :: ESI.Request.t()
  def create_cspa(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/cspa/",
      opts_schema: %{
        characters: {:body, :required},
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.stats/2`](#stats/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type stats_opts :: [stats_opt]
  @type stats_opt :: {:token, nil | String.t()}

  @doc """
  Returns aggregate yearly stats for a character.

  ## Response Example

  Character stats:

      [
        %{
          "character" => %{
            "days_of_activity" => 365,
            "minutes" => 1000000,
            "sessions_started" => 500
          },
          "combat" => %{"kills_low_sec" => 42},
          "year" => 2014
        },
        %{
          "character" => %{
            "days_of_activity" => 365,
            "minutes" => 1000000,
            "sessions_started" => 500
          },
          "combat" => %{"kills_null_sec" => 1337},
          "year" => 2015
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_stats`
  - `path` -- `/characters/{character_id}/stats/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_stats)

  """
  @spec stats(character_id :: integer, opts :: stats_opts) :: ESI.Request.t()
  def stats(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/stats/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.blueprints/2`](#blueprints/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type blueprints_opts :: [blueprints_opt]
  @type blueprints_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return a list of blueprints the character owns.

  ## Response Example

  A list of blueprints:

      [
        %{
          "item_id" => 1000000010495,
          "location_flag" => "Hangar",
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

  - `operationId` -- `get_characters_character_id_blueprints`
  - `path` -- `/characters/{character_id}/blueprints/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_blueprints)

  """
  @spec blueprints(character_id :: integer, opts :: blueprints_opts) :: ESI.Request.t()
  def blueprints(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/blueprints/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.delete_contacts/2`](#delete_contacts/2).

  - `:contact_ids` (REQUIRED) -- A list of contacts to delete
  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_contacts_opts :: [delete_contacts_opt]
  @type delete_contacts_opt :: {:contact_ids, [integer]} | {:token, nil | String.t()}

  @doc """
  Bulk delete contacts.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/delete_characters_character_id_contacts)

  """
  @spec delete_contacts(character_id :: integer, opts :: delete_contacts_opts) :: ESI.Request.t()
  def delete_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{
        contact_ids: {:query, :required},
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.contacts/2`](#contacts/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type contacts_opts :: [contacts_opt]
  @type contacts_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return contacts of a character.

  ## Response Example

  A list of contacts:

      [
        %{
          "contact_id" => 123,
          "contact_type" => "character",
          "is_blocked" => true,
          "is_watched" => true,
          "standing" => 9.9
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_characters_character_id_contacts)

  """
  @spec contacts(character_id :: integer, opts :: contacts_opts) :: ESI.Request.t()
  def contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_contacts/2`](#create_contacts/2).

  - `:contact_ids` (REQUIRED) -- A list of contacts
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the new contact
  - `:standing` (REQUIRED) -- Standing for the contact
  - `:token` -- Access token to use if unable to set a header
  - `:watched` (DEFAULT: `false`) -- Whether the contact should be watched, note this is only effective on characters
  """
  @type create_contacts_opts :: [create_contacts_opt]
  @type create_contacts_opt ::
          {:contact_ids, [nil | integer]}
          | {:label_id, nil | integer}
          | {:standing, float}
          | {:token, nil | String.t()}
          | {:watched, nil | boolean}

  @doc """
  Bulk add contacts with same settings.

  ## Response Example

  A list of contact ids that successfully created:

      [123, 456]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/post_characters_character_id_contacts)

  """
  @spec create_contacts(character_id :: integer, opts :: create_contacts_opts) :: ESI.Request.t()
  def create_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{
        contact_ids: {:body, :required},
        datasource: {:query, :optional},
        label_id: {:query, :optional},
        standing: {:query, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional},
        watched: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.update_contacts/2`](#update_contacts/2).

  - `:contact_ids` (REQUIRED) -- A list of contacts
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the contact, use 0 for clearing label
  - `:standing` (REQUIRED) -- Standing for the contact
  - `:token` -- Access token to use if unable to set a header
  - `:watched` (DEFAULT: `false`) -- Whether the contact should be watched, note this is only effective on characters
  """
  @type update_contacts_opts :: [update_contacts_opt]
  @type update_contacts_opt ::
          {:contact_ids, [nil | integer]}
          | {:label_id, nil | integer}
          | {:standing, float}
          | {:token, nil | String.t()}
          | {:watched, nil | boolean}

  @doc """
  Bulk edit contacts with same settings.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/put_characters_character_id_contacts)

  """
  @spec update_contacts(character_id :: integer, opts :: update_contacts_opts) :: ESI.Request.t()
  def update_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{
        contact_ids: {:body, :required},
        datasource: {:query, :optional},
        label_id: {:query, :optional},
        standing: {:query, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional},
        watched: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.attendees/3`](#attendees/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type attendees_opts :: [attendees_opt]
  @type attendees_opt :: {:token, nil | String.t()}

  @doc """
  Get all invited attendees for a given event.

  ## Response Example

  List of attendees:

      [
        %{"character_id" => 2112625428, "event_response" => "accepted"},
        %{"character_id" => 95465499, "event_response" => "tentative"}
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_calendar_event_id_attendees`
  - `path` -- `/characters/{character_id}/calendar/{event_id}/attendees/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/get_characters_character_id_calendar_event_id_attendees)

  """
  @spec attendees(character_id :: integer, event_id :: integer, opts :: attendees_opts) ::
          ESI.Request.t()
  def attendees(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/#{event_id}/attendees/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.mining/2`](#mining/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type mining_opts :: [mining_opt]
  @type mining_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Paginated record of all mining done by a character for the past 30 days.

  ## Response Example

  Mining ledger of a character:

      [
        %{
          "date" => "2017-09-19",
          "quantity" => 7004,
          "solar_system_id" => 30003707,
          "type_id" => 17471
        },
        %{
          "date" => "2017-09-18",
          "quantity" => 5199,
          "solar_system_id" => 30003707,
          "type_id" => 17471
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mining`
  - `path` -- `/characters/{character_id}/mining/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_characters_character_id_mining)

  """
  @spec mining(character_id :: integer, opts :: mining_opts) :: ESI.Request.t()
  def mining(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mining/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.orders/2`](#orders/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type orders_opts :: [orders_opt]
  @type orders_opt :: {:token, nil | String.t()}

  @doc """
  List open market orders placed by a character.

  ## Response Example

  Open market orders placed by a character:

      [
        %{
          "duration" => 30,
          "escrow" => 45.6,
          "is_buy_order" => true,
          "is_corporation" => false,
          "issued" => "2016-09-03T05:12:25Z",
          "location_id" => 456,
          "min_volume" => 1,
          "order_id" => 123,
          "price" => 33.3,
          "range" => "station",
          "region_id" => 123,
          "type_id" => 456,
          "volume_remain" => 4422,
          "volume_total" => 123456
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_orders`
  - `path` -- `/characters/{character_id}/orders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_characters_character_id_orders)

  """
  @spec orders(character_id :: integer, opts :: orders_opts) :: ESI.Request.t()
  def orders(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/orders/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.clones/2`](#clones/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type clones_opts :: [clones_opt]
  @type clones_opt :: {:token, nil | String.t()}

  @doc """
  A list of the character's clones.

  ## Response Example

  Clone information for the given character:

      %{
        "home_location" => %{
          "location_id" => 1021348135816,
          "location_type" => "structure"
        },
        "jump_clones" => [
          %{
            "implants" => [22118],
            "jump_clone_id" => 12345,
            "location_id" => 60003463,
            "location_type" => "station"
          }
        ]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_clones`
  - `path` -- `/characters/{character_id}/clones/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Clones/get_characters_character_id_clones)

  """
  @spec clones(character_id :: integer, opts :: clones_opts) :: ESI.Request.t()
  def clones(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/clones/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.loyalty_points/2`](#loyalty_points/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type loyalty_points_opts :: [loyalty_points_opt]
  @type loyalty_points_opt :: {:token, nil | String.t()}

  @doc """
  Return a list of loyalty points for all corporations the character has worked for.

  ## Response Example

  A list of loyalty points:

      [%{"corporation_id" => 123, "loyalty_points" => 100}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_loyalty_points`
  - `path` -- `/characters/{character_id}/loyalty/points/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Loyalty/get_characters_character_id_loyalty_points)

  """
  @spec loyalty_points(character_id :: integer, opts :: loyalty_points_opts) :: ESI.Request.t()
  def loyalty_points(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/loyalty/points/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.chat_channels/2`](#chat_channels/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type chat_channels_opts :: [chat_channels_opt]
  @type chat_channels_opt :: {:token, nil | String.t()}

  @doc """
  Return chat channels that a character is the owner or operator of.

  ## Response Example

  A list of chat channels:

      [
        %{
          "allowed" => [],
          "blocked" => [],
          "channel_id" => -69329950,
          "comparison_key" => "players'haven",
          "has_password" => false,
          "motd" => "<b>Feed pineapples to the cats!</b>",
          "muted" => [],
          "name" => "Players' Haven",
          "operators" => [],
          "owner_id" => 95578451
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_chat_channels`
  - `path` -- `/characters/{character_id}/chat_channels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_chat_channels)

  """
  @spec chat_channels(character_id :: integer, opts :: chat_channels_opts) :: ESI.Request.t()
  def chat_channels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/chat_channels/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.mail_lists/2`](#mail_lists/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type mail_lists_opts :: [mail_lists_opt]
  @type mail_lists_opt :: {:token, nil | String.t()}

  @doc """
  Return all mailing lists that the character is subscribed to.

  ## Response Example

  Mailing lists:

      [%{"mailing_list_id" => 1, "name" => "test_mailing_list"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_lists`
  - `path` -- `/characters/{character_id}/mail/lists/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_lists)

  """
  @spec mail_lists(character_id :: integer, opts :: mail_lists_opts) :: ESI.Request.t()
  def mail_lists(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/lists/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_asset_names/2`](#create_asset_names/2).

  - `:item_ids` (REQUIRED) -- A list of item ids
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_asset_names_opts :: [create_asset_names_opt]
  @type create_asset_names_opt :: {:item_ids, [nil | integer]} | {:token, nil | String.t()}

  @doc """
  Return names for a set of item ids, which you can get from character assets endpoint. Typically used for items that can customize names, like containers or ships..

  ## Response Example

  List of asset names:

      [%{"item_id" => 12345, "name" => "Awesome Name"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_assets_names`
  - `path` -- `/characters/{character_id}/assets/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/post_characters_character_id_assets_names)

  """
  @spec create_asset_names(character_id :: integer, opts :: create_asset_names_opts) ::
          ESI.Request.t()
  def create_asset_names(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/assets/names/",
      opts_schema: %{
        datasource: {:query, :optional},
        item_ids: {:body, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.agents_research/2`](#agents_research/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type agents_research_opts :: [agents_research_opt]
  @type agents_research_opt :: {:token, nil | String.t()}

  @doc """
  Return a list of agents research information for a character. The formula for finding the current research points with an agent is: currentPoints = remainderPoints + pointsPerDay * days(currentTime - researchStartDate).

  ## Response Example

  A list of agents research information:

      [
        %{
          "agent_id" => 3009358,
          "points_per_day" => 53.5346162147,
          "remainder_points" => 53604.0634303189,
          "skill_type_id" => 11450,
          "started_at" => "2017-03-23T14:47:00Z"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_agents_research`
  - `path` -- `/characters/{character_id}/agents_research/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_agents_research)

  """
  @spec agents_research(character_id :: integer, opts :: agents_research_opts) :: ESI.Request.t()
  def agents_research(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/agents_research/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.contact_labels/2`](#contact_labels/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type contact_labels_opts :: [contact_labels_opt]
  @type contact_labels_opt :: {:token, nil | String.t()}

  @doc """
  Return custom labels for a character's contacts.

  ## Response Example

  A list of contact labels:

      [%{"label_id" => 123, "label_name" => "Friends"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_contacts_labels`
  - `path` -- `/characters/{character_id}/contacts/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_characters_character_id_contacts_labels)

  """
  @spec contact_labels(character_id :: integer, opts :: contact_labels_opts) :: ESI.Request.t()
  def contact_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/labels/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.skills/2`](#skills/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type skills_opts :: [skills_opt]
  @type skills_opt :: {:token, nil | String.t()}

  @doc """
  List all trained skills for the given character.

  ## Response Example

  Known skills for the character:

      %{
        "skills" => [
          %{
            "active_skill_level" => 3,
            "skill_id" => 1,
            "skillpoints_in_skill" => 10000,
            "trained_skill_level" => 4
          },
          %{
            "active_skill_level" => 1,
            "skill_id" => 2,
            "skillpoints_in_skill" => 10000,
            "trained_skill_level" => 1
          }
        ],
        "total_sp" => 20000
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_skills`
  - `path` -- `/characters/{character_id}/skills/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_skills)

  """
  @spec skills(character_id :: integer, opts :: skills_opts) :: ESI.Request.t()
  def skills(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skills/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.killmail_recent/2`](#killmail_recent/2).

  - `:max_count` (DEFAULT: `50`) -- How many killmails to return at maximum
  - `:max_kill_id` -- Only return killmails with ID smaller than this.

  - `:token` -- Access token to use if unable to set a header
  """
  @type killmail_recent_opts :: [killmail_recent_opt]
  @type killmail_recent_opt ::
          {:max_count, nil | integer} | {:max_kill_id, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return a list of character's recent kills and losses.

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

  - `operationId` -- `get_characters_character_id_killmails_recent`
  - `path` -- `/characters/{character_id}/killmails/recent/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Killmails/get_characters_character_id_killmails_recent)

  """
  @spec killmail_recent(character_id :: integer, opts :: killmail_recent_opts) :: ESI.Request.t()
  def killmail_recent(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/killmails/recent/",
      opts_schema: %{
        datasource: {:query, :optional},
        max_count: {:query, :optional},
        max_kill_id: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.medals/2`](#medals/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type medals_opts :: [medals_opt]
  @type medals_opt :: {:token, nil | String.t()}

  @doc """
  Return a list of medals the character has.

  ## Response Example

  A list of medals:

      [
        %{
          "corporation_id" => 98000001,
          "date" => "2017-03-16T15:01:45Z",
          "description" => "For 33 corp!",
          "graphics" => [
            %{"color" => -1, "graphic" => "caldari.1_1", "layer" => 0, "part" => 1},
            %{
              "color" => -330271,
              "graphic" => "caldari.1_2",
              "layer" => 1,
              "part" => 1
            },
            %{"color" => -1, "graphic" => "compass.1_2", "layer" => 0, "part" => 2}
          ],
          "issuer_id" => 2112000002,
          "medal_id" => 3,
          "reason" => "Thanks!",
          "status" => "private",
          "title" => "33 tester medal"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_medals`
  - `path` -- `/characters/{character_id}/medals/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_medals)

  """
  @spec medals(character_id :: integer, opts :: medals_opts) :: ESI.Request.t()
  def medals(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/medals/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.calendar/2`](#calendar/2).

  - `:from_event` -- The event ID to retrieve events from
  - `:token` -- Access token to use if unable to set a header
  """
  @type calendar_opts :: [calendar_opt]
  @type calendar_opt :: {:from_event, nil | integer} | {:token, nil | String.t()}

  @doc """
  Get 50 event summaries from the calendar. If no from_event ID is given, the resource will return the next 50 chronological event summaries from now. If a from_event ID is specified, it will return the next 50 chronological event summaries from after that event..

  ## Response Example

  A collection of event summaries:

      [
        %{
          "event_date" => "2016-06-26T20:00:00Z",
          "event_id" => 1386435,
          "event_response" => "accepted",
          "importance" => 0,
          "title" => "o7 The EVE Online Show"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_calendar`
  - `path` -- `/characters/{character_id}/calendar/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/get_characters_character_id_calendar)

  """
  @spec calendar(character_id :: integer, opts :: calendar_opts) :: ESI.Request.t()
  def calendar(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/",
      opts_schema: %{
        datasource: {:query, :optional},
        from_event: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.wallet/2`](#wallet/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type wallet_opts :: [wallet_opt]
  @type wallet_opt :: {:token, nil | String.t()}

  @doc """
  Returns a character's wallet balance.

  ## Response Example

  Wallet balance:

      29500.01

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_wallet`
  - `path` -- `/characters/{character_id}/wallet/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_characters_character_id_wallet)

  """
  @spec wallet(character_id :: integer, opts :: wallet_opts) :: ESI.Request.t()
  def wallet(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/wallet/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_asset_locations/2`](#create_asset_locations/2).

  - `:item_ids` (REQUIRED) -- A list of item ids
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_asset_locations_opts :: [create_asset_locations_opt]
  @type create_asset_locations_opt :: {:item_ids, [nil | integer]} | {:token, nil | String.t()}

  @doc """
  Return locations for a set of item ids, which you can get from character assets endpoint. Coordinates for items in hangars or stations are set to (0,0,0).

  ## Response Example

  List of asset locations:

      [%{"item_id" => 12345, "position" => %{"x" => 1.2, "y" => 2.3, "z" => -3.4}}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_assets_locations`
  - `path` -- `/characters/{character_id}/assets/locations/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/post_characters_character_id_assets_locations)

  """
  @spec create_asset_locations(character_id :: integer, opts :: create_asset_locations_opts) ::
          ESI.Request.t()
  def create_asset_locations(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/assets/locations/",
      opts_schema: %{
        datasource: {:query, :optional},
        item_ids: {:body, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.planet/3`](#planet/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type planet_opts :: [planet_opt]
  @type planet_opt :: {:token, nil | String.t()}

  @doc """
  Returns full details on the layout of a single planetary colony, including links, pins and routes. Note: Planetary information is only recalculated when the colony is viewed through the client. Information will not update until this criteria is met..

  ## Response Example

  Colony layout:

      %{
        "links" => [
          %{
            "destination_pin_id" => 1000000017022,
            "link_level" => 0,
            "source_pin_id" => 1000000017021
          }
        ],
        "pins" => [
          %{
            "latitude" => 1.5508784497,
            "longitude" => 0.7171459333,
            "pin_id" => 1000000017021,
            "type_id" => 2254
          },
          %{
            "latitude" => 1.5336063994,
            "longitude" => 0.7097755844,
            "pin_id" => 1000000017022,
            "type_id" => 2256
          }
        ],
        "routes" => [
          %{
            "content_type_id" => 2393,
            "destination_pin_id" => 1000000017030,
            "quantity" => 20,
            "route_id" => 4,
            "source_pin_id" => 1000000017029
          }
        ]
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_planets_planet_id`
  - `path` -- `/characters/{character_id}/planets/{planet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_characters_character_id_planets_planet_id)

  """
  @spec planet(character_id :: integer, planet_id :: integer, opts :: planet_opts) ::
          ESI.Request.t()
  def planet(character_id, planet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/#{planet_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.industry_jobs/2`](#industry_jobs/2).

  - `:include_completed` -- Whether retrieve completed character industry jobs as well
  - `:token` -- Access token to use if unable to set a header
  """
  @type industry_jobs_opts :: [industry_jobs_opt]
  @type industry_jobs_opt :: {:include_completed, nil | boolean} | {:token, nil | String.t()}

  @doc """
  List industry jobs placed by a character.

  ## Response Example

  Industry jobs placed by a character:

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
          "output_location_id" => 60006382,
          "runs" => 1,
          "start_date" => "2014-07-19T15:47:06Z",
          "station_id" => 60006382,
          "status" => "active"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_industry_jobs`
  - `path` -- `/characters/{character_id}/industry/jobs/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_characters_character_id_industry_jobs)

  """
  @spec industry_jobs(character_id :: integer, opts :: industry_jobs_opts) :: ESI.Request.t()
  def industry_jobs(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/industry/jobs/",
      opts_schema: %{
        datasource: {:query, :optional},
        include_completed: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @doc """
  Get portrait urls for a character.

  ## Response Example

  Public data for the given character:

      %{
        "px128x128" => "https://imageserver.eveonline.com/Character/95465499_128.jpg",
        "px256x256" => "https://imageserver.eveonline.com/Character/95465499_256.jpg",
        "px512x512" => "https://imageserver.eveonline.com/Character/95465499_512.jpg",
        "px64x64" => "https://imageserver.eveonline.com/Character/95465499_64.jpg"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_portrait`
  - `path` -- `/characters/{character_id}/portrait/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_portrait)

  """
  @spec portrait(character_id :: integer) :: ESI.Request.t()
  def portrait(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/portrait/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Character.mail/2`](#mail/2).

  - `:labels` -- Fetch only mails that match one or more of the given labels
  - `:last_mail_id` -- List only mail with an ID lower than the given ID, if present
  - `:token` -- Access token to use if unable to set a header
  """
  @type mail_opts :: [mail_opt]
  @type mail_opt ::
          {:labels, nil | [integer]} | {:last_mail_id, nil | integer} | {:token, nil | String.t()}

  @doc """
  Return the 50 most recent mail headers belonging to the character that match the query criteria. Queries can be filtered by label, and last_mail_id can be used to paginate backwards..

  ## Response Example

  The requested mail:

      [
        %{
          "from" => 90000001,
          "is_read" => true,
          "labels" => [3],
          "mail_id" => 7,
          "recipients" => [
            %{"recipient_id" => 90000002, "recipient_type" => "character"}
          ],
          "subject" => "Title for EVE Mail",
          "timestamp" => "2015-09-30T16:07:00Z"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail`
  - `path` -- `/characters/{character_id}/mail/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail)

  """
  @spec mail(character_id :: integer, opts :: mail_opts) :: ESI.Request.t()
  def mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/",
      opts_schema: %{
        datasource: {:query, :optional},
        labels: {:query, :optional},
        last_mail_id: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_mail/2`](#create_mail/2).

  - `:mail` (REQUIRED) -- The mail to send
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_mail_opts :: [create_mail_opt]
  @type create_mail_opt ::
          {:mail,
           [
             approved_cost: nil | integer,
             body: String.t(),
             recipients: [
               [
                 recipient_id: integer,
                 recipient_type: :alliance | :character | :corporation | :mailing_list
               ]
             ],
             subject: String.t()
           ]}
          | {:token, nil | String.t()}

  @doc """
  Create and send a new mail.

  ## Response Example

  Mail created:

      13

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_mail`
  - `path` -- `/characters/{character_id}/mail/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/post_characters_character_id_mail)

  """
  @spec create_mail(character_id :: integer, opts :: create_mail_opts) :: ESI.Request.t()
  def create_mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/",
      opts_schema: %{
        datasource: {:query, :optional},
        mail: {:body, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.fleet/2`](#fleet/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type fleet_opts :: [fleet_opt]
  @type fleet_opt :: {:token, nil | String.t()}

  @doc """
  Return the fleet ID the character is in, if any..

  ## Response Example

  Details about the character's fleet:

      %{
        "fleet_id" => 1234567890,
        "role" => "fleet_commander",
        "squad_id" => -1,
        "wing_id" => -1
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_fleet`
  - `path` -- `/characters/{character_id}/fleet/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fleets/get_characters_character_id_fleet)

  """
  @spec fleet(character_id :: integer, opts :: fleet_opts) :: ESI.Request.t()
  def fleet(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fleet/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.delete_fitting/3`](#delete_fitting/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_fitting_opts :: [delete_fitting_opt]
  @type delete_fitting_opt :: {:token, nil | String.t()}

  @doc """
  Delete a fitting from a character.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_fittings_fitting_id`
  - `path` -- `/characters/{character_id}/fittings/{fitting_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/delete_characters_character_id_fittings_fitting_id)

  """
  @spec delete_fitting(
          character_id :: integer,
          fitting_id :: integer,
          opts :: delete_fitting_opts
        ) :: ESI.Request.t()
  def delete_fitting(character_id, fitting_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/fittings/#{fitting_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.calendar_event/3`](#calendar_event/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type calendar_event_opts :: [calendar_event_opt]
  @type calendar_event_opt :: {:token, nil | String.t()}

  @doc """
  Get all the information for a specific event.

  ## Response Example

  Full details of a specific event:

      %{
        "date" => "2016-06-26T21:00:00Z",
        "duration" => 60,
        "event_id" => 1386435,
        "importance" => 1,
        "owner_id" => 1,
        "owner_name" => "EVE System",
        "owner_type" => "eve_server",
        "response" => "Undecided",
        "text" => "o7: The EVE Online Show features latest developer news, fast paced action, community overviews and a lot more with CCP Guard and CCP Mimic. Join the thrilling o7 live broadcast at 20:00 EVE time (=UTC) on <a href=\"http://www.twitch.tv/ccp\">EVE TV</a>. Don't miss it!",
        "title" => "o7 The EVE Online Show"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_calendar_event_id`
  - `path` -- `/characters/{character_id}/calendar/{event_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/get_characters_character_id_calendar_event_id)

  """
  @spec calendar_event(character_id :: integer, event_id :: integer, opts :: calendar_event_opts) ::
          ESI.Request.t()
  def calendar_event(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/#{event_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.update_calendar_event/3`](#update_calendar_event/3).

  - `:response` (REQUIRED) -- The response value to set, overriding current value.
  - `:token` -- Access token to use if unable to set a header
  """
  @type update_calendar_event_opts :: [update_calendar_event_opt]
  @type update_calendar_event_opt ::
          {:response, [response: :accepted | :declined | :tentative]} | {:token, nil | String.t()}

  @doc """
  Set your response status to an event.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_characters_character_id_calendar_event_id`
  - `path` -- `/characters/{character_id}/calendar/{event_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/put_characters_character_id_calendar_event_id)

  """
  @spec update_calendar_event(
          character_id :: integer,
          event_id :: integer,
          opts :: update_calendar_event_opts
        ) :: ESI.Request.t()
  def update_calendar_event(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/calendar/#{event_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        response: {:body, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.items/3`](#items/3).

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

  - `operationId` -- `get_characters_character_id_contracts_contract_id_items`
  - `path` -- `/characters/{character_id}/contracts/{contract_id}/items/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_characters_character_id_contracts_contract_id_items)

  """
  @spec items(character_id :: integer, contract_id :: integer, opts :: items_opts) ::
          ESI.Request.t()
  def items(character_id, contract_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contracts/#{contract_id}/items/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_affiliation/1`](#create_affiliation/1).

  - `:characters` (REQUIRED) -- The character IDs to fetch affiliations for. All characters must exist, or none will be returned.
  """
  @type create_affiliation_opts :: [create_affiliation_opt]
  @type create_affiliation_opt :: {:characters, [nil | integer]}

  @doc """
  Bulk lookup of character IDs to corporation, alliance and faction.

  ## Response Example

  Character corporation, alliance and faction IDs:

      [
        %{
          "alliance_id" => 434243723,
          "character_id" => 95538921,
          "corporation_id" => 109299958
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_affiliation`
  - `path` -- `/characters/affiliation/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/post_characters_affiliation)

  """
  @spec create_affiliation(opts :: create_affiliation_opts) :: ESI.Request.t()
  def create_affiliation(opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/affiliation/",
      opts_schema: %{
        characters: {:body, :required},
        datasource: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.opportunities/2`](#opportunities/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type opportunities_opts :: [opportunities_opt]
  @type opportunities_opt :: {:token, nil | String.t()}

  @doc """
  Return a list of tasks finished by a character.

  ## Response Example

  A list of opportunities task ids:

      [%{"completed_at" => "2016-04-29T12:34:56Z", "task_id" => 1}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_opportunities`
  - `path` -- `/characters/{character_id}/opportunities/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Opportunities/get_characters_character_id_opportunities)

  """
  @spec opportunities(character_id :: integer, opts :: opportunities_opts) :: ESI.Request.t()
  def opportunities(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/opportunities/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @doc """
  Get a list of all the corporations a character has been a member of.

  ## Response Example

  Corporation history for the given character:

      [
        %{
          "corporation_id" => 90000001,
          "is_deleted" => true,
          "record_id" => 500,
          "start_date" => "2016-06-26T20:00:00Z"
        },
        %{
          "corporation_id" => 90000002,
          "record_id" => 501,
          "start_date" => "2016-07-26T20:00:00Z"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_corporationhistory`
  - `path` -- `/characters/{character_id}/corporationhistory/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_corporationhistory)

  """
  @spec corporation_history(character_id :: integer) :: ESI.Request.t()
  def corporation_history(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/corporationhistory/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}}
    }
  end

  @typedoc """
  Options for [`Character.notifications/2`](#notifications/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type notifications_opts :: [notifications_opt]
  @type notifications_opt :: {:token, nil | String.t()}

  @doc """
  Return character notifications.

  ## Response Example

  Returns your recent notifications:

      [
        %{
          "is_read" => true,
          "notification_id" => 1,
          "sender_id" => 1000132,
          "sender_type" => "corporation",
          "text" => "amount: 3731016.4000000004\\nitemID: 1024881021663\\npayout: 1\\n",
          "timestamp" => "2017-08-16T10:08:00Z",
          "type" => "InsurancePayoutMsg"
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_notifications`
  - `path` -- `/characters/{character_id}/notifications/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_notifications)

  """
  @spec notifications(character_id :: integer, opts :: notifications_opts) :: ESI.Request.t()
  def notifications(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/notifications/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.titles/2`](#titles/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type titles_opts :: [titles_opt]
  @type titles_opt :: {:token, nil | String.t()}

  @doc """
  Returns a character's titles.

  ## Response Example

  A list of titles:

      [%{"name" => "Awesome Title", "title_id" => 1}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_titles`
  - `path` -- `/characters/{character_id}/titles/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_titles)

  """
  @spec titles(character_id :: integer, opts :: titles_opts) :: ESI.Request.t()
  def titles(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/titles/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.location/2`](#location/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type location_opts :: [location_opt]
  @type location_opt :: {:token, nil | String.t()}

  @doc """
  Information about the characters current location. Returns the current solar system id, and also the current station or structure ID if applicable..

  ## Response Example

  Information about the characters current location. Returns the current solar system id, and also the current station or structure ID if applicable.:

      %{"solar_system_id" => 30002505, "structure_id" => 1000000016989}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_location`
  - `path` -- `/characters/{character_id}/location/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Location/get_characters_character_id_location)

  """
  @spec location(character_id :: integer, opts :: location_opts) :: ESI.Request.t()
  def location(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/location/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.fw_stats/2`](#fw_stats/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type fw_stats_opts :: [fw_stats_opt]
  @type fw_stats_opt :: {:token, nil | String.t()}

  @doc """
  Statistical overview of a character involved in faction warfare.

  ## Response Example

  Faction warfare statistics for a given character:

      %{
        "enlisted_on" => "2017-10-17T00:00:00Z",
        "faction_id" => 500001,
        "kills" => %{"last_week" => 893, "total" => 684350, "yesterday" => 136},
        "victory_points" => %{
          "last_week" => 102640,
          "total" => 52658260,
          "yesterday" => 15980
        }
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_fw_stats`
  - `path` -- `/characters/{character_id}/fw/stats/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Faction Warfare/get_characters_character_id_fw_stats)

  """
  @spec fw_stats(character_id :: integer, opts :: fw_stats_opts) :: ESI.Request.t()
  def fw_stats(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fw/stats/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.bids/3`](#bids/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type bids_opts :: [bids_opt]
  @type bids_opt :: {:token, nil | String.t()}

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

  - `operationId` -- `get_characters_character_id_contracts_contract_id_bids`
  - `path` -- `/characters/{character_id}/contracts/{contract_id}/bids/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contracts/get_characters_character_id_contracts_contract_id_bids)

  """
  @spec bids(character_id :: integer, contract_id :: integer, opts :: bids_opts) ::
          ESI.Request.t()
  def bids(character_id, contract_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contracts/#{contract_id}/bids/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.wallet_journal/2`](#wallet_journal/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type wallet_journal_opts :: [wallet_journal_opt]
  @type wallet_journal_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  Retrieve the given character's wallet journal going 30 days back.

  ## Response Example

  Journal entries:

      [
        %{
          "amount" => -100000,
          "balance" => 500000.4316,
          "context_id" => 4,
          "context_id_type" => "contract_id",
          "date" => "2018-02-23T14:31:32Z",
          "description" => "Contract Deposit",
          "first_party_id" => 2112625428,
          "id" => 89,
          "ref_type" => "contract_deposit",
          "second_party_id" => 1000132
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_wallet_journal`
  - `path` -- `/characters/{character_id}/wallet/journal/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_characters_character_id_wallet_journal)

  """
  @spec wallet_journal(character_id :: integer, opts :: wallet_journal_opts) :: ESI.Request.t()
  def wallet_journal(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/wallet/journal/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.notification_contacts/2`](#notification_contacts/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type notification_contacts_opts :: [notification_contacts_opt]
  @type notification_contacts_opt :: {:token, nil | String.t()}

  @doc """
  Return notifications about having been added to someone's contact list.

  ## Response Example

  A list of contact notifications:

      [
        %{
          "message" => "hello friend :3",
          "notification_id" => 1,
          "send_date" => "2017-08-16T10:08:00Z",
          "sender_character_id" => 95465499,
          "standing_level" => 1.5
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_notifications_contacts`
  - `path` -- `/characters/{character_id}/notifications/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_notifications_contacts)

  """
  @spec notification_contacts(character_id :: integer, opts :: notification_contacts_opts) ::
          ESI.Request.t()
  def notification_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/notifications/contacts/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.implants/2`](#implants/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type implants_opts :: [implants_opt]
  @type implants_opt :: {:token, nil | String.t()}

  @doc """
  Return implants on the active clone of a character.

  ## Response Example

  A list of implant type ids:

      [1, 2, 3]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_implants`
  - `path` -- `/characters/{character_id}/implants/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Clones/get_characters_character_id_implants)

  """
  @spec implants(character_id :: integer, opts :: implants_opts) :: ESI.Request.t()
  def implants(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/implants/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.mail_labels/2`](#mail_labels/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type mail_labels_opts :: [mail_labels_opt]
  @type mail_labels_opt :: {:token, nil | String.t()}

  @doc """
  Return a list of the users mail labels, unread counts for each label and a total unread count..

  ## Response Example

  A list of mail labels and unread counts:

      %{
        "labels" => [
          %{
            "color" => "#660066",
            "label_id" => 16,
            "name" => "PINK",
            "unread_count" => 4
          },
          %{
            "color" => "#ffffff",
            "label_id" => 17,
            "name" => "WHITE",
            "unread_count" => 1
          }
        ],
        "total_unread_count" => 5
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_labels`
  - `path` -- `/characters/{character_id}/mail/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_labels)

  """
  @spec mail_labels(character_id :: integer, opts :: mail_labels_opts) :: ESI.Request.t()
  def mail_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/labels/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.create_mail_labels/2`](#create_mail_labels/2).

  - `:label` (REQUIRED) -- Label to create
  - `:token` -- Access token to use if unable to set a header
  """
  @type create_mail_labels_opts :: [create_mail_labels_opt]
  @type create_mail_labels_opt ::
          {:label,
           [
             color:
               nil
               | :"#0000fe"
               | :"#006634"
               | :"#0099ff"
               | :"#00ff33"
               | :"#01ffff"
               | :"#349800"
               | :"#660066"
               | :"#666666"
               | :"#999999"
               | :"#99ffff"
               | :"#9a0000"
               | :"#ccff9a"
               | :"#e6e6e6"
               | :"#fe0000"
               | :"#ff6600"
               | :"#ffff01"
               | :"#ffffcd"
               | :"#ffffff",
             name: String.t()
           ]}
          | {:token, nil | String.t()}

  @doc """
  Create a mail label.

  ## Response Example

  Label created:

      128

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_mail_labels`
  - `path` -- `/characters/{character_id}/mail/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/post_characters_character_id_mail_labels)

  """
  @spec create_mail_labels(character_id :: integer, opts :: create_mail_labels_opts) ::
          ESI.Request.t()
  def create_mail_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/labels/",
      opts_schema: %{
        datasource: {:query, :optional},
        label: {:body, :required},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.order_history/2`](#order_history/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  - `:token` -- Access token to use if unable to set a header
  """
  @type order_history_opts :: [order_history_opt]
  @type order_history_opt :: {:page, nil | integer} | {:token, nil | String.t()}

  @doc """
  List cancelled and expired market orders placed by a character up to 90 days in the past..

  ## Response Example

  Expired and cancelled market orders placed by a character:

      [
        %{
          "duration" => 30,
          "escrow" => 45.6,
          "is_buy_order" => true,
          "is_corporation" => false,
          "issued" => "2016-09-03T05:12:25Z",
          "location_id" => 456,
          "min_volume" => 1,
          "order_id" => 123,
          "price" => 33.3,
          "range" => "station",
          "region_id" => 123,
          "state" => "expired",
          "type_id" => 456,
          "volume_remain" => 4422,
          "volume_total" => 123456
        }
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_orders_history`
  - `path` -- `/characters/{character_id}/orders/history/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Market/get_characters_character_id_orders_history)

  """
  @spec order_history(character_id :: integer, opts :: order_history_opts) :: ESI.Request.t()
  def order_history(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/orders/history/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.standings/2`](#standings/2).

  - `:token` -- Access token to use if unable to set a header
  """
  @type standings_opts :: [standings_opt]
  @type standings_opt :: {:token, nil | String.t()}

  @doc """
  Return character standings from agents, NPC corporations, and factions.

  ## Response Example

  A list of standings:

      [
        %{"from_id" => 3009841, "from_type" => "agent", "standing" => 0.1},
        %{"from_id" => 1000061, "from_type" => "npc_corp", "standing" => 0},
        %{"from_id" => 500003, "from_type" => "faction", "standing" => -1}
      ]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_standings`
  - `path` -- `/characters/{character_id}/standings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_standings)

  """
  @spec standings(character_id :: integer, opts :: standings_opts) :: ESI.Request.t()
  def standings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/standings/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.delete_mail_item/3`](#delete_mail_item/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type delete_mail_item_opts :: [delete_mail_item_opt]
  @type delete_mail_item_opt :: {:token, nil | String.t()}

  @doc """
  Delete a mail.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/delete_characters_character_id_mail_mail_id)

  """
  @spec delete_mail_item(
          character_id :: integer,
          mail_id :: integer,
          opts :: delete_mail_item_opts
        ) :: ESI.Request.t()
  def delete_mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.mail_item/3`](#mail_item/3).

  - `:token` -- Access token to use if unable to set a header
  """
  @type mail_item_opts :: [mail_item_opt]
  @type mail_item_opt :: {:token, nil | String.t()}

  @doc """
  Return the contents of an EVE mail.

  ## Response Example

  Contents of a mail:

      %{
        "body" => "blah blah blah",
        "from" => 90000001,
        "labels" => [2, 32],
        "read" => true,
        "subject" => "test",
        "timestamp" => "2015-09-30T16:07:00Z"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_mail_id)

  """
  @spec mail_item(character_id :: integer, mail_id :: integer, opts :: mail_item_opts) ::
          ESI.Request.t()
  def mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      opts_schema: %{
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`Character.update_mail_item/3`](#update_mail_item/3).

  - `:contents` (REQUIRED) -- Data used to update the mail
  - `:token` -- Access token to use if unable to set a header
  """
  @type update_mail_item_opts :: [update_mail_item_opt]
  @type update_mail_item_opt ::
          {:contents, [labels: nil | [integer], read: nil | boolean]} | {:token, nil | String.t()}

  @doc """
  Update metadata about a mail.

  ## Response Example

  No example available.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/put_characters_character_id_mail_mail_id)

  """
  @spec update_mail_item(
          character_id :: integer,
          mail_id :: integer,
          opts :: update_mail_item_opts
        ) :: ESI.Request.t()
  def update_mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      opts_schema: %{
        contents: {:body, :required},
        datasource: {:query, :optional},
        token: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end
end
