defmodule ESI.API.Character do

  @doc """
  List your character's personal bookmarks.

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

  @doc """
  Return fittings of a character.

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
    fitting: nil | [description: nil | String.t, items: nil | [nil | [flag: nil | integer, quantity: nil | integer, type_id: nil | integer]], name: nil | String.t, ship_type_id: nil | integer],
  ]


  @doc """
  Save a new fitting for a character.

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

  @doc """
  Get the current ship type, name and id.

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
    categories: [nil | :agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :structure | :wormhole],
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
  ]


  @doc """
  Search for entities that match a given sub-string..

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
    character_ids: [nil | integer],
  ]


  @doc """
  Resolve a set of character IDs to character names.

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

  @doc """
  Delete a mail label.

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

  @doc """
  List your character's personal bookmark folders.

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

  @doc """
  Return a list of the characters assets.

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

  @doc """
  List the configured skill queue for the given character.

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

  @doc """
  Public information about a character.

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

  @doc """
  Returns a list of all planetary colonies owned by a character..

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
    characters: [characters: nil | [nil | integer]],
  ]


  @doc """
  Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost.

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


  @doc """
  Bulk delete contacts.

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


  @doc """
  Return contacts of a character.

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


  @doc """
  Bulk add contacts with same settings.

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


  @doc """
  Bulk edit contacts with same settings.

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

  @doc """
  A list of the character's clones.

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

  @doc """
  Return all mailing lists that the character is subscribed to.

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

  @doc """
  Return custom labels for contacts the character defined.

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

  @doc """
  List all trained skills for the given character.

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


  @doc """
  Return a list of character's recent kills and losses.

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


  @doc """
  Get 50 event summaries from the calendar. If no event ID is given,.

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

  @doc """
  Returns full details on the layout of a single planetary colony, including links, pins and routes. Note: Planetary information is only recalculated when the colony is viewed through the client. Information on this endpoint will not update until this criteria is met..

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

  @doc """
  Get portrait urls for a character.

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
    labels: nil | [nil | integer],
    last_mail_id: nil | integer,
  ]


  @doc """
  Return the 50 most recent mail headers belonging to the character that match the query criteria. Queries can be filtered by label, and last_mail_id can be used to paginate backwards..

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
    mail: [approved_cost: nil | integer, body: nil | String.t, recipients: nil | [nil | [recipient_id: nil | integer, recipient_type: nil | :alliance | :character | :corporation | :mailing_list]], subject: nil | String.t],
  ]


  @doc """
  Create and send a new mail.

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

  @doc """
  Delete a fitting from a character.

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

  @doc """
  Get all the information for a specific event.

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
    response: [response: nil | :accepted | :declined | :tentative],
  ]


  @doc """
  Set your response status to an event.

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

  @doc """
  List your wallets and their balances. Characters typically have only one wallet, with wallet_id 1000 being the master wallet..

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

  @doc """
  Get a list of all the corporations a character has been a member of.

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

  @doc """
  Information about the characters current location. Returns the current solar system id, and also the current station or structure ID if applicable..

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

  @doc """
  Return a list of the users mail labels, unread counts for each label and a total unread count..

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
    label: nil | [color: nil | :"#ffffff" | :"#ffff01" | :"#ff6600" | :"#fe0000" | :"#9a0000" | :"#660066" | :"#0000fe" | :"#0099ff" | :"#01ffff" | :"#00ff33" | :"#349800" | :"#006634" | :"#666666" | :"#999999" | :"#e6e6e6" | :"#ffffcd" | :"#99ffff" | :"#ccff9a", name: nil | String.t],
  ]


  @doc """
  Create a mail label.

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

  @doc """
  Delete a mail.

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

  @doc """
  Return the contents of an EVE mail.

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
    contents: [labels: nil | [nil | integer], read: nil | boolean],
  ]


  @doc """
  Update metadata about a mail.

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