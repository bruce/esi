defmodule ESI.API.Character do

  @type bookmarks_result :: [[bookmark_id: integer, create_date: String.t, creator_id: integer, folder_id: nil | integer, memo: String.t, note: String.t, owner_id: integer, target: [coordinates: nil | [x: integer, y: integer, z: integer], item: nil | [item_id: integer, type_id: integer], location_id: integer]]]


  @doc """
  List your character's personal bookmarks.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`bookmarks_result`](#t:bookmarks_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_bookmarks`
  - `path` -- `/characters/{character_id}/bookmarks/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_characters_character_id_bookmarks)

  """
  @spec bookmarks(character_id :: integer) :: ESI.Request.t
  def bookmarks(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/",

    }
  end

  @type fittings_result :: [[description: String.t, fitting_id: integer, items: [[flag: integer, quantity: integer, type_id: integer]], name: String.t, ship_type_id: integer]]


  @doc """
  Return fittings of a character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`fittings_result`](#t:fittings_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_fittings`
  - `path` -- `/characters/{character_id}/fittings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/get_characters_character_id_fittings)

  """
  @spec fittings(character_id :: integer) :: ESI.Request.t
  def fittings(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fittings/",

    }
  end

  @typedoc """
  - `:fitting` -- Details about the new fitting
  """
  @type create_fittings_opts :: [
    fitting: nil | [description: String.t, items: [[flag: integer, quantity: integer, type_id: integer]], name: String.t, ship_type_id: integer],
  ]

  @type create_fittings_result :: [fitting_id: integer]


  @doc """
  Save a new fitting for a character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_fittings_result`](#t:create_fittings_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_fittings`
  - `path` -- `/characters/{character_id}/fittings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/post_characters_character_id_fittings)

  """
  @spec create_fittings(character_id :: integer, opts :: create_fittings_opts) :: ESI.Request.t
  def create_fittings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/fittings/",
      body_opts: Keyword.take(opts, [:fitting]),
    }
  end

  @type ship_result :: [ship_item_id: integer, ship_name: String.t, ship_type_id: integer]


  @doc """
  Get the current ship type, name and id.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`ship_result`](#t:ship_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_ship`
  - `path` -- `/characters/{character_id}/ship/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Location/get_characters_character_id_ship)

  """
  @spec ship(character_id :: integer) :: ESI.Request.t
  def ship(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/ship/",

    }
  end

  @typedoc """
  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  """
  @type search_opts :: [
    categories: [:agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :structure | :wormhole],
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
  ]

  @type search_result :: [agent: nil | [integer], alliance: nil | [integer], character: nil | [integer], constellation: nil | [integer], corporation: nil | [integer], faction: nil | [integer], inventorytype: nil | [integer], region: nil | [integer], solarsystem: nil | [integer], station: nil | [integer], structure: nil | [integer], wormhole: nil | [integer]]


  @doc """
  Search for entities that match a given sub-string..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`search_result`](#t:search_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_search`
  - `path` -- `/characters/{character_id}/search/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Search/get_characters_character_id_search)

  """
  @spec search(character_id :: integer, opts :: search_opts) :: ESI.Request.t
  def search(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/search/",
      query_opts: Keyword.take(opts, [:categories, :language, :search, :strict]),
    }
  end

  @typedoc """
  - `:character_ids` (REQUIRED) -- A comma separated list of character IDs
  """
  @type names_opts :: [
    character_ids: [integer],
  ]

  @type names_result :: [[character_id: integer, character_name: String.t]]


  @doc """
  Resolve a set of character IDs to character names.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`names_result`](#t:names_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_names`
  - `path` -- `/characters/names/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_names)

  """
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/names/",
      query_opts: Keyword.take(opts, [:character_ids]),
    }
  end

  @type delete_mail_label_result :: any


  @doc """
  Delete a mail label.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_mail_label_result`](#t:delete_mail_label_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_mail_labels_label_id`
  - `path` -- `/characters/{character_id}/mail/labels/{label_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/delete_characters_character_id_mail_labels_label_id)

  """
  @spec delete_mail_label(character_id :: integer, label_id :: integer) :: ESI.Request.t
  def delete_mail_label(character_id, label_id) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/labels/#{label_id}/",

    }
  end

  @type bookmark_folders_result :: [[folder_id: nil | integer, name: nil | String.t, owner_id: nil | integer]]


  @doc """
  List your character's personal bookmark folders.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`bookmark_folders_result`](#t:bookmark_folders_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_bookmarks_folders`
  - `path` -- `/characters/{character_id}/bookmarks/folders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_characters_character_id_bookmarks_folders)

  """
  @spec bookmark_folders(character_id :: integer) :: ESI.Request.t
  def bookmark_folders(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/folders/",

    }
  end

  @type assets_result :: [[is_singleton: boolean, item_id: integer, location_flag: :AutoFit | :Cargo | :CorpseBay | :DroneBay | :FleetHangar | :Deliveries | :HiddenModifiers | :Hangar | :HangarAll | :LoSlot0 | :LoSlot1 | :LoSlot2 | :LoSlot3 | :LoSlot4 | :LoSlot5 | :LoSlot6 | :LoSlot7 | :MedSlot0 | :MedSlot1 | :MedSlot2 | :MedSlot3 | :MedSlot4 | :MedSlot5 | :MedSlot6 | :MedSlot7 | :HiSlot0 | :HiSlot1 | :HiSlot2 | :HiSlot3 | :HiSlot4 | :HiSlot5 | :HiSlot6 | :HiSlot7 | :AssetSafety | :Locked | :Unlocked | :Implant | :QuafeBay | :RigSlot0 | :RigSlot1 | :RigSlot2 | :RigSlot3 | :RigSlot4 | :RigSlot5 | :RigSlot6 | :RigSlot7 | :ShipHangar | :SpecializedFuelBay | :SpecializedOreHold | :SpecializedGasHold | :SpecializedMineralHold | :SpecializedSalvageHold | :SpecializedShipHold | :SpecializedSmallShipHold | :SpecializedMediumShipHold | :SpecializedLargeShipHold | :SpecializedIndustrialShipHold | :SpecializedAmmoHold | :SpecializedCommandCenterHold | :SpecializedPlanetaryCommoditiesHold | :SpecializedMaterialBay | :SubSystemSlot0 | :SubSystemSlot1 | :SubSystemSlot2 | :SubSystemSlot3 | :SubSystemSlot4 | :SubSystemSlot5 | :SubSystemSlot6 | :SubSystemSlot7 | :FighterBay | :FighterTube0 | :FighterTube1 | :FighterTube2 | :FighterTube3 | :FighterTube4 | :Module, location_id: integer, location_type: :station | :solar_system | :other, quantity: nil | integer, type_id: integer]]


  @doc """
  Return a list of the characters assets.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`assets_result`](#t:assets_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_assets`
  - `path` -- `/characters/{character_id}/assets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/get_characters_character_id_assets)

  """
  @spec assets(character_id :: integer) :: ESI.Request.t
  def assets(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/assets/",

    }
  end

  @type skillqueue_result :: [[finish_date: nil | String.t, finished_level: integer, level_end_sp: nil | integer, level_start_sp: nil | integer, queue_position: integer, skill_id: integer, start_date: nil | String.t, training_start_sp: nil | integer]]


  @doc """
  List the configured skill queue for the given character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`skillqueue_result`](#t:skillqueue_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_skillqueue`
  - `path` -- `/characters/{character_id}/skillqueue/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_skillqueue)

  """
  @spec skillqueue(character_id :: integer) :: ESI.Request.t
  def skillqueue(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skillqueue/",

    }
  end

  @type character_result :: [alliance_id: nil | integer, ancestry_id: nil | integer, birthday: String.t, bloodline_id: integer, corporation_id: integer, description: nil | String.t, gender: :female | :male, name: String.t, race_id: integer, security_status: nil | float]


  @doc """
  Public information about a character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`character_result`](#t:character_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id`
  - `path` -- `/characters/{character_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id)

  """
  @spec character(character_id :: integer) :: ESI.Request.t
  def character(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/",

    }
  end

  @type planets_result :: [[last_update: String.t, num_pins: integer, owner_id: integer, planet_id: integer, planet_type: :temperate | :barren | :oceanic | :ice | :gas | :lava | :storm | :plasma, solar_system_id: integer, upgrade_level: integer]]


  @doc """
  Returns a list of all planetary colonies owned by a character..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`planets_result`](#t:planets_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_planets`
  - `path` -- `/characters/{character_id}/planets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_characters_character_id_planets)

  """
  @spec planets(character_id :: integer) :: ESI.Request.t
  def planets(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/",

    }
  end

  @typedoc """
  - `:characters` (REQUIRED) -- The target characters to calculate the charge for
  """
  @type create_cspa_opts :: [
    characters: [characters: [integer]],
  ]

  @type create_cspa_result :: [cost: nil | integer]


  @doc """
  Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_cspa_result`](#t:create_cspa_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_cspa`
  - `path` -- `/characters/{character_id}/cspa/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/post_characters_character_id_cspa)

  """
  @spec create_cspa(character_id :: integer, opts :: create_cspa_opts) :: ESI.Request.t
  def create_cspa(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/cspa/",
      body_opts: Keyword.take(opts, [:characters]),
    }
  end

  @typedoc """
  - `:contact_ids` (REQUIRED) -- A list of contacts to edit
  """
  @type delete_contacts_opts :: [
    contact_ids: [nil | integer],
  ]

  @type delete_contacts_result :: any


  @doc """
  Bulk delete contacts.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_contacts_result`](#t:delete_contacts_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/delete_characters_character_id_contacts)

  """
  @spec delete_contacts(character_id :: integer, opts :: delete_contacts_opts) :: ESI.Request.t
  def delete_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/contacts/",
      body_opts: Keyword.take(opts, [:contact_ids]),
    }
  end

  @typedoc """
  - `:page` (DEFAULT: `1`) -- page integer
  """
  @type contacts_opts :: [
    page: nil | integer,
  ]

  @type contacts_result :: [[contact_id: integer, contact_type: :character | :corporation | :alliance | :faction, is_blocked: nil | boolean, is_watched: nil | boolean, label_id: nil | integer, standing: float]]


  @doc """
  Return contacts of a character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`contacts_result`](#t:contacts_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_characters_character_id_contacts)

  """
  @spec contacts(character_id :: integer, opts :: contacts_opts) :: ESI.Request.t
  def contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/",
      query_opts: Keyword.take(opts, [:page]),
    }
  end

  @typedoc """
  - `:contact_ids` (REQUIRED) -- A list of contacts to add
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the new contact
  - `:standing` (REQUIRED) -- Standing for the new contact
  - `:watched` (DEFAULT: `false`) -- Whether the new contact should be watched, note this is only effective on characters
  """
  @type create_contacts_opts :: [
    contact_ids: [nil | integer],
    label_id: nil | integer,
    standing: float,
    watched: nil | boolean,
  ]

  @type create_contacts_result :: [integer]


  @doc """
  Bulk add contacts with same settings.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_contacts_result`](#t:create_contacts_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/post_characters_character_id_contacts)

  """
  @spec create_contacts(character_id :: integer, opts :: create_contacts_opts) :: ESI.Request.t
  def create_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/contacts/",
      body_opts: Keyword.take(opts, [:contact_ids]),
      query_opts: Keyword.take(opts, [:label_id, :standing, :watched]),
    }
  end

  @typedoc """
  - `:contact_ids` (REQUIRED) -- A list of contacts to edit
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the contact, use 0 for clearing label
  - `:standing` (REQUIRED) -- Standing for the contact
  - `:watched` (DEFAULT: `false`) -- Whether the contact should be watched, note this is only effective on characters
  """
  @type update_contacts_opts :: [
    contact_ids: [nil | integer],
    label_id: nil | integer,
    standing: float,
    watched: nil | boolean,
  ]

  @type update_contacts_result :: any


  @doc """
  Bulk edit contacts with same settings.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_contacts_result`](#t:update_contacts_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_characters_character_id_contacts`
  - `path` -- `/characters/{character_id}/contacts/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/put_characters_character_id_contacts)

  """
  @spec update_contacts(character_id :: integer, opts :: update_contacts_opts) :: ESI.Request.t
  def update_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/contacts/",
      body_opts: Keyword.take(opts, [:contact_ids]),
      query_opts: Keyword.take(opts, [:label_id, :standing, :watched]),
    }
  end

  @type clones_result :: [home_location: nil | [location_id: nil | integer, location_type: nil | :station | :structure], jump_clones: [[implants: nil | [integer], location_id: nil | integer, location_type: nil | :station | :structure]], last_jump_date: nil | String.t]


  @doc """
  A list of the character's clones.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`clones_result`](#t:clones_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_clones`
  - `path` -- `/characters/{character_id}/clones/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Clones/get_characters_character_id_clones)

  """
  @spec clones(character_id :: integer) :: ESI.Request.t
  def clones(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/clones/",

    }
  end

  @type mail_lists_result :: [[mailing_list_id: integer, name: String.t]]


  @doc """
  Return all mailing lists that the character is subscribed to.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`mail_lists_result`](#t:mail_lists_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_lists`
  - `path` -- `/characters/{character_id}/mail/lists/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_lists)

  """
  @spec mail_lists(character_id :: integer) :: ESI.Request.t
  def mail_lists(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/lists/",

    }
  end

  @type contact_labels_result :: [[label_id: integer, label_name: String.t]]


  @doc """
  Return custom labels for contacts the character defined.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`contact_labels_result`](#t:contact_labels_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_contacts_labels`
  - `path` -- `/characters/{character_id}/contacts/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_characters_character_id_contacts_labels)

  """
  @spec contact_labels(character_id :: integer) :: ESI.Request.t
  def contact_labels(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/labels/",

    }
  end

  @type skills_result :: [skills: nil | [[current_skill_level: nil | integer, skill_id: nil | integer, skillpoints_in_skill: nil | integer]], total_sp: nil | integer]


  @doc """
  List all trained skills for the given character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`skills_result`](#t:skills_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_skills`
  - `path` -- `/characters/{character_id}/skills/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_skills)

  """
  @spec skills(character_id :: integer) :: ESI.Request.t
  def skills(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skills/",

    }
  end

  @typedoc """
  - `:max_count` (DEFAULT: `50`) -- How many killmails to return at maximum
  - `:max_kill_id` -- Only return killmails with ID smaller than this.

  """
  @type killmail_recent_opts :: [
    max_count: nil | integer,
    max_kill_id: nil | integer,
  ]

  @type killmail_recent_result :: [[killmail_hash: String.t, killmail_id: integer]]


  @doc """
  Return a list of character's recent kills and losses.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`killmail_recent_result`](#t:killmail_recent_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_killmails_recent`
  - `path` -- `/characters/{character_id}/killmails/recent/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Killmails/get_characters_character_id_killmails_recent)

  """
  @spec killmail_recent(character_id :: integer, opts :: killmail_recent_opts) :: ESI.Request.t
  def killmail_recent(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/killmails/recent/",
      query_opts: Keyword.take(opts, [:max_count, :max_kill_id]),
    }
  end

  @typedoc """
  - `:from_event` -- The event ID to retrieve events from
  """
  @type calendar_opts :: [
    from_event: nil | integer,
  ]

  @type calendar_result :: [[event_date: nil | String.t, event_id: nil | integer, event_response: nil | :declined | :not_responded | :accepted | :tentative, importance: nil | integer, title: nil | String.t]]


  @doc """
  Get 50 event summaries from the calendar. If no event ID is given,.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`calendar_result`](#t:calendar_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_calendar`
  - `path` -- `/characters/{character_id}/calendar/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/get_characters_character_id_calendar)

  """
  @spec calendar(character_id :: integer, opts :: calendar_opts) :: ESI.Request.t
  def calendar(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/",
      query_opts: Keyword.take(opts, [:from_event]),
    }
  end

  @type planet_result :: [links: [[destination_pin_id: integer, link_level: integer, source_pin_id: integer]], pins: [[expiry_time: nil | String.t, extractor_details: nil | [cycle_time: integer, head_radius: float, heads: [[head_id: integer, latitude: float, longitude: float]], product_type_id: integer, qty_per_cycle: integer], factory_details: nil | [schematic_id: integer], install_time: nil | String.t, last_cycle_start: nil | String.t, latitude: float, longitude: float, pin_id: integer, schematic_id: nil | integer, type_id: integer]], routes: [[content_type_id: integer, destination_pin_id: integer, quantity: integer, route_id: integer, source_pin_id: integer, waypoints: nil | [[order: integer, pin_id: integer]]]]]


  @doc """
  Returns full details on the layout of a single planetary colony, including links, pins and routes. Note: Planetary information is only recalculated when the colony is viewed through the client. Information on this endpoint will not update until this criteria is met..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`planet_result`](#t:planet_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_planets_planet_id`
  - `path` -- `/characters/{character_id}/planets/{planet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_characters_character_id_planets_planet_id)

  """
  @spec planet(character_id :: integer, planet_id :: integer) :: ESI.Request.t
  def planet(character_id, planet_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/#{planet_id}/",

    }
  end

  @type portrait_result :: [px128x128: nil | String.t, px256x256: nil | String.t, px512x512: nil | String.t, px64x64: nil | String.t]


  @doc """
  Get portrait urls for a character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`portrait_result`](#t:portrait_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_portrait`
  - `path` -- `/characters/{character_id}/portrait/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_portrait)

  """
  @spec portrait(character_id :: integer) :: ESI.Request.t
  def portrait(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/portrait/",

    }
  end

  @typedoc """
  - `:labels` -- Fetch only mails that match one or more of the given labels
  - `:last_mail_id` -- List only mail with an ID lower than the given ID, if present
  """
  @type mail_opts :: [
    labels: nil | [integer],
    last_mail_id: nil | integer,
  ]

  @type mail_result :: [[from: nil | integer, is_read: nil | boolean, labels: nil | [integer], mail_id: nil | integer, recipients: nil | [[recipient_id: integer, recipient_type: :alliance | :character | :corporation | :mailing_list]], subject: nil | String.t, timestamp: nil | String.t]]


  @doc """
  Return the 50 most recent mail headers belonging to the character that match the query criteria. Queries can be filtered by label, and last_mail_id can be used to paginate backwards..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`mail_result`](#t:mail_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail`
  - `path` -- `/characters/{character_id}/mail/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail)

  """
  @spec mail(character_id :: integer, opts :: mail_opts) :: ESI.Request.t
  def mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/",
      query_opts: Keyword.take(opts, [:labels, :last_mail_id]),
    }
  end

  @typedoc """
  - `:mail` (REQUIRED) -- The mail to send
  """
  @type create_mail_opts :: [
    mail: [approved_cost: nil | integer, body: String.t, recipients: [[recipient_id: integer, recipient_type: :alliance | :character | :corporation | :mailing_list]], subject: String.t],
  ]

  @type create_mail_result :: integer


  @doc """
  Create and send a new mail.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_mail_result`](#t:create_mail_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_mail`
  - `path` -- `/characters/{character_id}/mail/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/post_characters_character_id_mail)

  """
  @spec create_mail(character_id :: integer, opts :: create_mail_opts) :: ESI.Request.t
  def create_mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/",
      body_opts: Keyword.take(opts, [:mail]),
    }
  end

  @type delete_fitting_result :: any


  @doc """
  Delete a fitting from a character.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_fitting_result`](#t:delete_fitting_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_fittings_fitting_id`
  - `path` -- `/characters/{character_id}/fittings/{fitting_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/delete_characters_character_id_fittings_fitting_id)

  """
  @spec delete_fitting(character_id :: integer, fitting_id :: integer) :: ESI.Request.t
  def delete_fitting(character_id, fitting_id) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/fittings/#{fitting_id}/",

    }
  end

  @type calendar_event_result :: [date: String.t, duration: integer, event_id: integer, importance: integer, owner_id: integer, owner_name: String.t, owner_type: :eve_server | :corporation | :faction | :character | :alliance, response: String.t, text: String.t, title: String.t]


  @doc """
  Get all the information for a specific event.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`calendar_event_result`](#t:calendar_event_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_calendar_event_id`
  - `path` -- `/characters/{character_id}/calendar/{event_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/get_characters_character_id_calendar_event_id)

  """
  @spec calendar_event(character_id :: integer, event_id :: integer) :: ESI.Request.t
  def calendar_event(character_id, event_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/#{event_id}/",

    }
  end

  @typedoc """
  - `:response` (REQUIRED) -- The response value to set, overriding current value.
  """
  @type update_calendar_event_opts :: [
    response: [response: :accepted | :declined | :tentative],
  ]

  @type update_calendar_event_result :: any


  @doc """
  Set your response status to an event.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_calendar_event_result`](#t:update_calendar_event_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_characters_character_id_calendar_event_id`
  - `path` -- `/characters/{character_id}/calendar/{event_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/put_characters_character_id_calendar_event_id)

  """
  @spec update_calendar_event(character_id :: integer, event_id :: integer, opts :: update_calendar_event_opts) :: ESI.Request.t
  def update_calendar_event(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/calendar/#{event_id}/",
      body_opts: Keyword.take(opts, [:response]),
    }
  end

  @type wallets_result :: [[balance: nil | integer, wallet_id: nil | integer]]


  @doc """
  List your wallets and their balances. Characters typically have only one wallet, with wallet_id 1000 being the master wallet..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`wallets_result`](#t:wallets_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_wallets`
  - `path` -- `/characters/{character_id}/wallets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_characters_character_id_wallets)

  """
  @spec wallets(character_id :: integer) :: ESI.Request.t
  def wallets(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/wallets/",

    }
  end

  @type corporation_history_result :: [[corporation_id: nil | integer, is_deleted: nil | boolean, record_id: nil | integer, start_date: nil | String.t]]


  @doc """
  Get a list of all the corporations a character has been a member of.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`corporation_history_result`](#t:corporation_history_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_corporationhistory`
  - `path` -- `/characters/{character_id}/corporationhistory/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Character/get_characters_character_id_corporationhistory)

  """
  @spec corporation_history(character_id :: integer) :: ESI.Request.t
  def corporation_history(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/corporationhistory/",

    }
  end

  @type location_result :: [solar_system_id: integer, station_id: nil | integer, structure_id: nil | integer]


  @doc """
  Information about the characters current location. Returns the current solar system id, and also the current station or structure ID if applicable..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`location_result`](#t:location_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_location`
  - `path` -- `/characters/{character_id}/location/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Location/get_characters_character_id_location)

  """
  @spec location(character_id :: integer) :: ESI.Request.t
  def location(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/location/",

    }
  end

  @type mail_labels_result :: [labels: nil | [[color: nil | :"#ffffff" | :"#ffff01" | :"#ff6600" | :"#fe0000" | :"#9a0000" | :"#660066" | :"#0000fe" | :"#0099ff" | :"#01ffff" | :"#00ff33" | :"#349800" | :"#006634" | :"#666666" | :"#999999" | :"#e6e6e6" | :"#ffffcd" | :"#99ffff" | :"#ccff9a", label_id: nil | integer, name: nil | String.t, unread_count: nil | integer]], total_unread_count: nil | integer]


  @doc """
  Return a list of the users mail labels, unread counts for each label and a total unread count..

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`mail_labels_result`](#t:mail_labels_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_labels`
  - `path` -- `/characters/{character_id}/mail/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_labels)

  """
  @spec mail_labels(character_id :: integer) :: ESI.Request.t
  def mail_labels(character_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/labels/",

    }
  end

  @typedoc """
  - `:label` -- Label to create
  """
  @type create_mail_labels_opts :: [
    label: nil | [color: nil | :"#ffffff" | :"#ffff01" | :"#ff6600" | :"#fe0000" | :"#9a0000" | :"#660066" | :"#0000fe" | :"#0099ff" | :"#01ffff" | :"#00ff33" | :"#349800" | :"#006634" | :"#666666" | :"#999999" | :"#e6e6e6" | :"#ffffcd" | :"#99ffff" | :"#ccff9a", name: String.t],
  ]

  @type create_mail_labels_result :: integer


  @doc """
  Create a mail label.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`create_mail_labels_result`](#t:create_mail_labels_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `post_characters_character_id_mail_labels`
  - `path` -- `/characters/{character_id}/mail/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/post_characters_character_id_mail_labels)

  """
  @spec create_mail_labels(character_id :: integer, opts :: create_mail_labels_opts) :: ESI.Request.t
  def create_mail_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/labels/",
      body_opts: Keyword.take(opts, [:label]),
    }
  end

  @type delete_mail_item_result :: any


  @doc """
  Delete a mail.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`delete_mail_item_result`](#t:delete_mail_item_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `delete_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/delete_characters_character_id_mail_mail_id)

  """
  @spec delete_mail_item(character_id :: integer, mail_id :: integer) :: ESI.Request.t
  def delete_mail_item(character_id, mail_id) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/#{mail_id}/",

    }
  end

  @type mail_item_result :: [body: nil | String.t, from: nil | integer, labels: nil | [integer], read: nil | boolean, recipients: nil | [[recipient_id: integer, recipient_type: :alliance | :character | :corporation | :mailing_list]], subject: nil | String.t, timestamp: nil | String.t]


  @doc """
  Return the contents of an EVE mail.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`mail_item_result`](#t:mail_item_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_mail_id)

  """
  @spec mail_item(character_id :: integer, mail_id :: integer) :: ESI.Request.t
  def mail_item(character_id, mail_id) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/#{mail_id}/",

    }
  end

  @typedoc """
  - `:contents` (REQUIRED) -- Data used to update the mail
  """
  @type update_mail_item_opts :: [
    contents: [labels: nil | [integer], read: nil | boolean],
  ]

  @type update_mail_item_result :: any


  @doc """
  Update metadata about a mail.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`update_mail_item_result`](#t:update_mail_item_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `put_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/put_characters_character_id_mail_mail_id)

  """
  @spec update_mail_item(character_id :: integer, mail_id :: integer, opts :: update_mail_item_opts) :: ESI.Request.t
  def update_mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      body_opts: Keyword.take(opts, [:contents]),
    }
  end
end