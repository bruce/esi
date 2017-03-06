defmodule ESI.API.Character do

  @typedoc """
  Options for [`Character.bookmarks/2`](#bookmarks/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type bookmarks_opts :: [
    token: nil | String.t,
  ]


  @doc """
  List your character's personal bookmarks.

  ## Response Example

  A list of bookmarks:

      [%{"bookmark_id" => 32, "create_date" => "2016-08-09T11:57:47Z",
         "creator_id" => 90000001, "folder_id" => 5, "memo" => "aoeu ( Citadel )",
         "note" => "", "owner_id" => 90000001,
         "target" => %{"item" => %{"item_id" => 1000000012668, "type_id" => 35832},
           "location_id" => 30000005}}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_bookmarks`
  - `path` -- `/characters/{character_id}/bookmarks/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_characters_character_id_bookmarks)

  """
  @spec bookmarks(character_id :: integer, opts :: bookmarks_opts) :: ESI.Request.t
  def bookmarks(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.fittings/2`](#fittings/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type fittings_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Return fittings of a character.

  ## Response Example

  A list of fittings:

      [%{"description" => "Awesome Vindi fitting", "fitting_id" => 1,
         "items" => [%{"flag" => 12, "quantity" => 1, "type_id" => 1234}],
         "name" => "Best Vindicator", "ship_type_id" => 123}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_fittings`
  - `path` -- `/characters/{character_id}/fittings/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Fittings/get_characters_character_id_fittings)

  """
  @spec fittings(character_id :: integer, opts :: fittings_opts) :: ESI.Request.t
  def fittings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fittings/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.create_fittings/2`](#create_fittings/2).

  - `:fitting` -- Details about the new fitting
  - `:token` -- Access token to use, if preferred over a header
  """
  @type create_fittings_opts :: [
    fitting: nil | [description: String.t, items: [[flag: integer, quantity: integer, type_id: integer]], name: String.t, ship_type_id: integer],
    token: nil | String.t,
  ]


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
  @spec create_fittings(character_id :: integer, opts :: create_fittings_opts) :: ESI.Request.t
  def create_fittings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/fittings/",
      opts_schema: %{datasource: {:query, :optional}, fitting: {:body, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.ship/2`](#ship/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type ship_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Get the current ship type, name and id.

  ## Response Example

  Get the current ship type, name and id:

      %{"ship_item_id" => 1000000016991, "ship_name" => "SPACESHIPS!!!",
        "ship_type_id" => 1233}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_ship`
  - `path` -- `/characters/{character_id}/ship/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Location/get_characters_character_id_ship)

  """
  @spec ship(character_id :: integer, opts :: ship_opts) :: ESI.Request.t
  def ship(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/ship/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.search/2`](#search/2).

  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  - `:token` -- Access token to use, if preferred over a header
  """
  @type search_opts :: [
    categories: [:agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :structure | :wormhole],
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
    token: nil | String.t,
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

  - `operationId` -- `get_characters_character_id_search`
  - `path` -- `/characters/{character_id}/search/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Search/get_characters_character_id_search)

  """
  @spec search(character_id :: integer, opts :: search_opts) :: ESI.Request.t
  def search(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/search/",
      opts_schema: %{categories: {:query, :required}, datasource: {:query, :optional}, language: {:query, :optional}, search: {:query, :required}, strict: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.names/1`](#names/1).

  - `:character_ids` (REQUIRED) -- A comma separated list of character IDs
  """
  @type names_opts :: [
    character_ids: [integer],
  ]


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
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/names/",
      opts_schema: %{character_ids: {:query, :required}, datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.delete_mail_label/3`](#delete_mail_label/3).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type delete_mail_label_opts :: [
    token: nil | String.t,
  ]


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
  @spec delete_mail_label(character_id :: integer, label_id :: integer, opts :: delete_mail_label_opts) :: ESI.Request.t
  def delete_mail_label(character_id, label_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/labels/#{label_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.bookmark_folders/2`](#bookmark_folders/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type bookmark_folders_opts :: [
    token: nil | String.t,
  ]


  @doc """
  List your character's personal bookmark folders.

  ## Response Example

  List of bookmark folders:

      [%{"folder_id" => 5, "name" => "Icecream", "owner_id" => 90000001}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_bookmarks_folders`
  - `path` -- `/characters/{character_id}/bookmarks/folders/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Bookmarks/get_characters_character_id_bookmarks_folders)

  """
  @spec bookmark_folders(character_id :: integer, opts :: bookmark_folders_opts) :: ESI.Request.t
  def bookmark_folders(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/folders/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.assets/2`](#assets/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type assets_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Return a list of the characters assets.

  ## Response Example

  A flat list of the users assets:

      [%{"is_singleton" => true, "item_id" => 1000000016835,
         "location_flag" => "Hangar", "location_id" => 60002959,
         "location_type" => "station", "type_id" => 3516}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_assets`
  - `path` -- `/characters/{character_id}/assets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Assets/get_characters_character_id_assets)

  """
  @spec assets(character_id :: integer, opts :: assets_opts) :: ESI.Request.t
  def assets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/assets/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.skillqueue/2`](#skillqueue/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type skillqueue_opts :: [
    token: nil | String.t,
  ]


  @doc """
  List the configured skill queue for the given character.

  ## Response Example

  The current skill queue, sorted ascending by finishing time:

      [%{"finish_date" => "2016-06-29T10:47:00Z", "finished_level" => 3,
         "queue_position" => 0, "skill_id" => 1,
         "start_date" => "2016-06-29T10:46:00Z"},
       %{"finish_date" => "2016-07-15T10:47:00Z", "finished_level" => 4,
         "queue_position" => 1, "skill_id" => 1,
         "start_date" => "2016-06-29T10:47:00Z"},
       %{"finish_date" => "2016-08-30T10:47:00Z", "finished_level" => 2,
         "queue_position" => 2, "skill_id" => 2,
         "start_date" => "2016-07-15T10:47:00Z"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_skillqueue`
  - `path` -- `/characters/{character_id}/skillqueue/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_skillqueue)

  """
  @spec skillqueue(character_id :: integer, opts :: skillqueue_opts) :: ESI.Request.t
  def skillqueue(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skillqueue/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Public information about a character.

  ## Response Example

  Public data for the given character:

      %{"ancestry_id" => 19, "birthday" => "2015-03-24T11:37:00Z",
        "bloodline_id" => 3, "corporation_id" => 109299958, "description" => "",
        "gender" => "male", "name" => "CCP Bartender", "race_id" => 2}

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Character.planets/2`](#planets/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type planets_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Returns a list of all planetary colonies owned by a character..

  ## Response Example

  List of colonies:

      [%{"last_update" => "2016-11-28T16:42:51Z", "num_pins" => 1,
         "owner_id" => 90000001, "planet_id" => 40023691, "planet_type" => "plasma",
         "solar_system_id" => 30000379, "upgrade_level" => 0},
       %{"last_update" => "2016-11-28T16:41:54Z", "num_pins" => 1,
         "owner_id" => 90000001, "planet_id" => 40023697, "planet_type" => "barren",
         "solar_system_id" => 30000379, "upgrade_level" => 0}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_planets`
  - `path` -- `/characters/{character_id}/planets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_characters_character_id_planets)

  """
  @spec planets(character_id :: integer, opts :: planets_opts) :: ESI.Request.t
  def planets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.create_cspa/2`](#create_cspa/2).

  - `:characters` (REQUIRED) -- The target characters to calculate the charge for
  - `:token` -- Access token to use, if preferred over a header
  """
  @type create_cspa_opts :: [
    characters: [characters: [integer]],
    token: nil | String.t,
  ]


  @doc """
  Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost.

  ## Response Example

  Aggregate cost of sending a mail from the source character to the target characters, in ISK hundredths:

      %{"cost" => 295000}

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
      opts_schema: %{characters: {:body, :required}, datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.delete_contacts/2`](#delete_contacts/2).

  - `:contact_ids` (REQUIRED) -- A list of contacts to edit
  - `:token` -- Access token to use, if preferred over a header
  """
  @type delete_contacts_opts :: [
    contact_ids: [nil | integer],
    token: nil | String.t,
  ]


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
  @spec delete_contacts(character_id :: integer, opts :: delete_contacts_opts) :: ESI.Request.t
  def delete_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{contact_ids: {:body, :required}, datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.contacts/2`](#contacts/2).

  - `:page` (DEFAULT: `1`) -- page integer
  - `:token` -- Access token to use, if preferred over a header
  """
  @type contacts_opts :: [
    page: nil | integer,
    token: nil | String.t,
  ]


  @doc """
  Return contacts of a character.

  ## Response Example

  A list of contacts:

      [%{"contact_id" => 123, "contact_type" => "character", "is_blocked" => false,
         "is_watched" => true, "standing" => 10.0}]

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
      opts_schema: %{datasource: {:query, :optional}, page: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.create_contacts/2`](#create_contacts/2).

  - `:contact_ids` (REQUIRED) -- A list of contacts to add
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the new contact
  - `:standing` (REQUIRED) -- Standing for the new contact
  - `:token` -- Access token to use, if preferred over a header
  - `:watched` (DEFAULT: `false`) -- Whether the new contact should be watched, note this is only effective on characters
  """
  @type create_contacts_opts :: [
    contact_ids: [nil | integer],
    label_id: nil | integer,
    standing: float,
    token: nil | String.t,
    watched: nil | boolean,
  ]


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
  @spec create_contacts(character_id :: integer, opts :: create_contacts_opts) :: ESI.Request.t
  def create_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{contact_ids: {:body, :required}, datasource: {:query, :optional}, label_id: {:query, :optional}, standing: {:query, :required}, token: {:query, :optional}, user_agent: {:query, :optional}, watched: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.update_contacts/2`](#update_contacts/2).

  - `:contact_ids` (REQUIRED) -- A list of contacts to edit
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the contact, use 0 for clearing label
  - `:standing` (REQUIRED) -- Standing for the contact
  - `:token` -- Access token to use, if preferred over a header
  - `:watched` (DEFAULT: `false`) -- Whether the contact should be watched, note this is only effective on characters
  """
  @type update_contacts_opts :: [
    contact_ids: [nil | integer],
    label_id: nil | integer,
    standing: float,
    token: nil | String.t,
    watched: nil | boolean,
  ]


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
  @spec update_contacts(character_id :: integer, opts :: update_contacts_opts) :: ESI.Request.t
  def update_contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/contacts/",
      opts_schema: %{contact_ids: {:body, :required}, datasource: {:query, :optional}, label_id: {:query, :optional}, standing: {:query, :required}, token: {:query, :optional}, user_agent: {:query, :optional}, watched: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.clones/2`](#clones/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type clones_opts :: [
    token: nil | String.t,
  ]


  @doc """
  A list of the character's clones.

  ## Response Example

  Clone information for the given character:

      %{"home_location" => %{"location_id" => 1021348135816,
          "location_type" => "structure"},
        "jump_clones" => [%{"implants" => [22118], "location_id" => 60003463,
           "location_type" => "station"},
         %{"implants" => [], "location_id" => 1021348135816,
           "location_type" => "structure"}]}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_clones`
  - `path` -- `/characters/{character_id}/clones/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Clones/get_characters_character_id_clones)

  """
  @spec clones(character_id :: integer, opts :: clones_opts) :: ESI.Request.t
  def clones(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/clones/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.loyalty_points/2`](#loyalty_points/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type loyalty_points_opts :: [
    token: nil | String.t,
  ]


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
  @spec loyalty_points(character_id :: integer, opts :: loyalty_points_opts) :: ESI.Request.t
  def loyalty_points(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/loyalty/points/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.mail_lists/2`](#mail_lists/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type mail_lists_opts :: [
    token: nil | String.t,
  ]


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
  @spec mail_lists(character_id :: integer, opts :: mail_lists_opts) :: ESI.Request.t
  def mail_lists(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/lists/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.contact_labels/2`](#contact_labels/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type contact_labels_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Return custom labels for contacts the character defined.

  ## Response Example

  A list of contact labels:

      [%{"label_id" => 123, "label_name" => "Friends"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_contacts_labels`
  - `path` -- `/characters/{character_id}/contacts/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Contacts/get_characters_character_id_contacts_labels)

  """
  @spec contact_labels(character_id :: integer, opts :: contact_labels_opts) :: ESI.Request.t
  def contact_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/labels/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.skills/2`](#skills/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type skills_opts :: [
    token: nil | String.t,
  ]


  @doc """
  List all trained skills for the given character.

  ## Response Example

  Known skills for the character:

      %{"skills" => [%{"current_skill_level" => 1, "skill_id" => 1,
           "skillpoints_in_skill" => 10000},
         %{"current_skill_level" => 1, "skill_id" => 2,
           "skillpoints_in_skill" => 10000}], "total_sp" => 20000}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_skills`
  - `path` -- `/characters/{character_id}/skills/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Skills/get_characters_character_id_skills)

  """
  @spec skills(character_id :: integer, opts :: skills_opts) :: ESI.Request.t
  def skills(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skills/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.killmail_recent/2`](#killmail_recent/2).

  - `:max_count` (DEFAULT: `50`) -- How many killmails to return at maximum
  - `:max_kill_id` -- Only return killmails with ID smaller than this.

  - `:token` -- Access token to use, if preferred over a header
  """
  @type killmail_recent_opts :: [
    max_count: nil | integer,
    max_kill_id: nil | integer,
    token: nil | String.t,
  ]


  @doc """
  Return a list of character's recent kills and losses.

  ## Response Example

  A list of killmail IDs and hashes:

      [%{"killmail_hash" => "8eef5e8fb6b88fe3407c489df33822b2e3b57a5e",
         "killmail_id" => 2},
       %{"killmail_hash" => "b41ccb498ece33d64019f64c0db392aa3aa701fb",
         "killmail_id" => 1}]

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
      opts_schema: %{datasource: {:query, :optional}, max_count: {:query, :optional}, max_kill_id: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.calendar/2`](#calendar/2).

  - `:from_event` -- The event ID to retrieve events from
  - `:token` -- Access token to use, if preferred over a header
  """
  @type calendar_opts :: [
    from_event: nil | integer,
    token: nil | String.t,
  ]


  @doc """
  Get 50 event summaries from the calendar. If no event ID is given,.

  ## Response Example

  A collection of event summaries:

      [%{"event_date" => "2016-06-26T20:00:00Z", "event_id" => 1386435,
         "event_response" => "accepted", "importance" => 0,
         "title" => "o7 The EVE Online Show"}]

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
      opts_schema: %{datasource: {:query, :optional}, from_event: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.planet/3`](#planet/3).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type planet_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Returns full details on the layout of a single planetary colony, including links, pins and routes. Note: Planetary information is only recalculated when the colony is viewed through the client. Information on this endpoint will not update until this criteria is met..

  ## Response Example

  Colony layout:

      %{"links" => [%{"destination_pin_id" => 1000000017022, "link_level" => 0,
           "source_pin_id" => 1000000017021}],
        "pins" => [%{"is_running" => true, "latitude" => 1.55087844973,
           "longitude" => 0.717145933308, "pin_id" => 1000000017021,
           "type_id" => 2254},
         %{"is_running" => true, "latitude" => 1.53360639935,
           "longitude" => 0.709775584394, "pin_id" => 1000000017022,
           "type_id" => 2256}],
        "routes" => [%{"content_type_id" => 2393,
           "destination_pin_id" => 1000000017030, "quantity" => 20, "route_id" => 4,
           "source_pin_id" => 1000000017029}]}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_planets_planet_id`
  - `path` -- `/characters/{character_id}/planets/{planet_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Planetary Interaction/get_characters_character_id_planets_planet_id)

  """
  @spec planet(character_id :: integer, planet_id :: integer, opts :: planet_opts) :: ESI.Request.t
  def planet(character_id, planet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/#{planet_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get portrait urls for a character.

  ## Response Example

  Public data for the given character:

      %{"px128x128" => "https://imageserver.eveonline.com/Character/95465499_128.jpg",
        "px256x256" => "https://imageserver.eveonline.com/Character/95465499_256.jpg",
        "px512x512" => "https://imageserver.eveonline.com/Character/95465499_512.jpg",
        "px64x64" => "https://imageserver.eveonline.com/Character/95465499_64.jpg"}

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Character.mail/2`](#mail/2).

  - `:labels` -- Fetch only mails that match one or more of the given labels
  - `:last_mail_id` -- List only mail with an ID lower than the given ID, if present
  - `:token` -- Access token to use, if preferred over a header
  """
  @type mail_opts :: [
    labels: nil | [integer],
    last_mail_id: nil | integer,
    token: nil | String.t,
  ]


  @doc """
  Return the 50 most recent mail headers belonging to the character that match the query criteria. Queries can be filtered by label, and last_mail_id can be used to paginate backwards..

  ## Response Example

  The requested mail:

      [%{"from" => 90000001, "is_read" => true, "labels" => [3], "mail_id" => 7,
         "recipients" => [%{"recipient_id" => 90000002,
            "recipient_type" => "character"}], "subject" => "Title for EVE Mail",
         "timestamp" => "2015-09-30T16:07:00Z"}]

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
      opts_schema: %{datasource: {:query, :optional}, labels: {:query, :optional}, last_mail_id: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.create_mail/2`](#create_mail/2).

  - `:mail` (REQUIRED) -- The mail to send
  - `:token` -- Access token to use, if preferred over a header
  """
  @type create_mail_opts :: [
    mail: [approved_cost: nil | integer, body: String.t, recipients: [[recipient_id: integer, recipient_type: :alliance | :character | :corporation | :mailing_list]], subject: String.t],
    token: nil | String.t,
  ]


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
  @spec create_mail(character_id :: integer, opts :: create_mail_opts) :: ESI.Request.t
  def create_mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/",
      opts_schema: %{datasource: {:query, :optional}, mail: {:body, :required}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.delete_fitting/3`](#delete_fitting/3).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type delete_fitting_opts :: [
    token: nil | String.t,
  ]


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
  @spec delete_fitting(character_id :: integer, fitting_id :: integer, opts :: delete_fitting_opts) :: ESI.Request.t
  def delete_fitting(character_id, fitting_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/fittings/#{fitting_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.calendar_event/3`](#calendar_event/3).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type calendar_event_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Get all the information for a specific event.

  ## Response Example

  Full details of a specific event:

      %{"date" => "2016-06-26T21:00:00Z", "duration" => 60, "event_id" => 1386435,
        "importance" => 1, "owner_id" => 1, "owner_name" => "EVE System",
        "owner_type" => "eve_server", "response" => "Undecided",
        "text" => "o7: The EVE Online Show features latest developer news, fast paced action, community overviews and a lot more with CCP Guard and CCP Mimic. Join the thrilling o7 live broadcast at 20:00 EVE time (=UTC) on <a href=\"http://www.twitch.tv/ccp\">EVE TV</a>. Don't miss it!",
        "title" => "o7 The EVE Online Show"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_calendar_event_id`
  - `path` -- `/characters/{character_id}/calendar/{event_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Calendar/get_characters_character_id_calendar_event_id)

  """
  @spec calendar_event(character_id :: integer, event_id :: integer, opts :: calendar_event_opts) :: ESI.Request.t
  def calendar_event(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/#{event_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.wallets/2`](#wallets/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type wallets_opts :: [
    token: nil | String.t,
  ]


  @doc """
  List your wallets and their balances. Characters typically have only one wallet, with wallet_id 1000 being the master wallet..

  ## Response Example

  Wallet data for selected user:

      [%{"balance" => 295000, "wallet_id" => 1000}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_wallets`
  - `path` -- `/characters/{character_id}/wallets/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wallet/get_characters_character_id_wallets)

  """
  @spec wallets(character_id :: integer, opts :: wallets_opts) :: ESI.Request.t
  def wallets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/wallets/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @doc """
  Get a list of all the corporations a character has been a member of.

  ## Response Example

  Corporation history for the given character:

      [%{"corporation_id" => 90000001, "is_deleted" => false, "record_id" => 500,
         "start_date" => "2016-06-26T20:00:00Z"},
       %{"corporation_id" => 90000002, "is_deleted" => false, "record_id" => 501,
         "start_date" => "2016-07-26T20:00:00Z"}]

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
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},

    }
  end

  @typedoc """
  Options for [`Character.location/2`](#location/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type location_opts :: [
    token: nil | String.t,
  ]


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
  @spec location(character_id :: integer, opts :: location_opts) :: ESI.Request.t
  def location(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/location/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.mail_labels/2`](#mail_labels/2).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type mail_labels_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Return a list of the users mail labels, unread counts for each label and a total unread count..

  ## Response Example

  A list of mail labels and unread counts:

      %{"labels" => [%{"color_hex" => "#660066", "label_id" => 16, "name" => "PINK",
           "unread_count" => 4},
         %{"color_hex" => "#ffffff", "label_id" => 17, "name" => "WHITE",
           "unread_count" => 1}], "total_unread_count" => 5}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_labels`
  - `path` -- `/characters/{character_id}/mail/labels/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_labels)

  """
  @spec mail_labels(character_id :: integer, opts :: mail_labels_opts) :: ESI.Request.t
  def mail_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/labels/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.create_mail_labels/2`](#create_mail_labels/2).

  - `:label` -- Label to create
  - `:token` -- Access token to use, if preferred over a header
  """
  @type create_mail_labels_opts :: [
    label: nil | [color: nil | :"#ffffff" | :"#ffff01" | :"#ff6600" | :"#fe0000" | :"#9a0000" | :"#660066" | :"#0000fe" | :"#0099ff" | :"#01ffff" | :"#00ff33" | :"#349800" | :"#006634" | :"#666666" | :"#999999" | :"#e6e6e6" | :"#ffffcd" | :"#99ffff" | :"#ccff9a", name: String.t],
    token: nil | String.t,
  ]


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
  @spec create_mail_labels(character_id :: integer, opts :: create_mail_labels_opts) :: ESI.Request.t
  def create_mail_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/labels/",
      opts_schema: %{datasource: {:query, :optional}, label: {:body, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.delete_mail_item/3`](#delete_mail_item/3).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type delete_mail_item_opts :: [
    token: nil | String.t,
  ]


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
  @spec delete_mail_item(character_id :: integer, mail_id :: integer, opts :: delete_mail_item_opts) :: ESI.Request.t
  def delete_mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.mail_item/3`](#mail_item/3).

  - `:token` -- Access token to use, if preferred over a header
  """
  @type mail_item_opts :: [
    token: nil | String.t,
  ]


  @doc """
  Return the contents of an EVE mail.

  ## Response Example

  Contents of a mail:

      %{"body" => "blah blah blah", "from" => 90000001, "labels" => [2, 32],
        "read" => false, "subject" => "test", "timestamp" => "2015-09-30T16:07:00Z"}

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_characters_character_id_mail_mail_id`
  - `path` -- `/characters/{character_id}/mail/{mail_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Mail/get_characters_character_id_mail_mail_id)

  """
  @spec mail_item(character_id :: integer, mail_id :: integer, opts :: mail_item_opts) :: ESI.Request.t
  def mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      opts_schema: %{datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
  Options for [`Character.update_mail_item/3`](#update_mail_item/3).

  - `:contents` (REQUIRED) -- Data used to update the mail
  - `:token` -- Access token to use, if preferred over a header
  """
  @type update_mail_item_opts :: [
    contents: [labels: nil | [integer], read: nil | boolean],
    token: nil | String.t,
  ]


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
  @spec update_mail_item(character_id :: integer, mail_id :: integer, opts :: update_mail_item_opts) :: ESI.Request.t
  def update_mail_item(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      opts_schema: %{contents: {:body, :required}, datasource: {:query, :optional}, token: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end