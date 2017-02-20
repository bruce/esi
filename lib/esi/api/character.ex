defmodule ESI.API.Character do

  @doc """
  List your character's personal bookmarks

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_bookmarks`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type bookmarks_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec bookmarks(character_id :: integer, opts :: bookmarks_opts) :: ESI.Request.t
  def bookmarks(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return fittings of a character

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_fittings`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type fittings_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec fittings(character_id :: integer, opts :: fittings_opts) :: ESI.Request.t
  def fittings(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/fittings/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Save a new fitting for a character

  ## Swagger

  The Swagger Operation ID for this function is `post_characters_character_id_fittings`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:fitting` -- Details about the new fitting
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_fitting_opts :: [
    datasource: nil | :tranquility | :singularity,
    fitting: nil | [description: nil | String.t, items: nil | [nil | [flag: nil | integer, quantity: nil | integer, type_id: nil | integer]], name: nil | String.t, ship_type_id: nil | integer],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec create_fitting(character_id :: integer, opts :: create_fitting_opts) :: ESI.Request.t
  def create_fitting(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/fittings/",
      body_opts: Keyword.take(opts, [:fitting]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Get the current ship type, name and id

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_ship`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type ship_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec ship(character_id :: integer, opts :: ship_opts) :: ESI.Request.t
  def ship(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/ship/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Search for entities that match a given sub-string.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_search`

  ## Options

  - `:categories` (REQUIRED) -- Type of entities to search for
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:language` (DEFAULT: `:"en-us"`) -- Search locale
  - `:search` (REQUIRED) -- The string to search on
  - `:strict` (DEFAULT: `false`) -- Whether the search should be a strict match
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type search_opts :: [
    categories: [nil | :agent | :alliance | :character | :constellation | :corporation | :faction | :inventorytype | :region | :solarsystem | :station | :structure | :wormhole],
    datasource: nil | :tranquility | :singularity,
    language: nil | :"en-us" | :de | :fr | :ru | :ja | :zh,
    search: String.t,
    strict: nil | boolean,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec search(character_id :: integer, opts :: search_opts) :: ESI.Request.t
  def search(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/search/",
      query_opts: Keyword.take(opts, [:categories, :datasource, :language, :search, :strict, :token, :user_agent]),
    }
  end

  @doc """
  Resolve a set of character IDs to character names

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_names`

  ## Options

  - `:character_ids` (REQUIRED) -- A comma separated list of character IDs
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type names_opts :: [
    character_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word]
  @spec names(opts :: names_opts) :: ESI.Request.t
  def names(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/names/",
      query_opts: Keyword.take(opts, [:character_ids, :datasource, :user_agent]),
    }
  end

  @doc """
  Delete a mail label

  ## Swagger

  The Swagger Operation ID for this function is `delete_characters_character_id_mail_labels_label_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_mail_label_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :word, :arg]
  @spec delete_mail_label(character_id :: integer, label_id :: integer, opts :: delete_mail_label_opts) :: ESI.Request.t
  def delete_mail_label(character_id, label_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/labels/#{label_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  List your character's personal bookmark folders

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_bookmarks_folders`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type bookmark_folders_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word, :arg]
  @spec bookmark_folders(character_id :: integer, opts :: bookmark_folders_opts) :: ESI.Request.t
  def bookmark_folders(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/bookmarks/folders/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return a list of the characters assets

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_assets`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type assets_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec assets(character_id :: integer, opts :: assets_opts) :: ESI.Request.t
  def assets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/assets/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  List the configured skill queue for the given character

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_skillqueue`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type skillqueue_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec skillqueue(character_id :: integer, opts :: skillqueue_opts) :: ESI.Request.t
  def skillqueue(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skillqueue/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Public information about a character

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type character_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:arg]
  @spec character(character_id :: integer, opts :: character_opts) :: ESI.Request.t
  def character(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Returns a list of all planetary colonies owned by a character.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_planets`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type planets_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec planets(character_id :: integer, opts :: planets_opts) :: ESI.Request.t
  def planets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Takes a source character ID in the url and a set of target character ID's in the body, returns a CSPA charge cost

  ## Swagger

  The Swagger Operation ID for this function is `post_characters_character_id_cspa`

  ## Options

  - `:characters` (REQUIRED) -- The target characters to calculate the charge for
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_cspa_opts :: [
    characters: [characters: nil | [nil | integer]],
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec create_cspa(character_id :: integer, opts :: create_cspa_opts) :: ESI.Request.t
  def create_cspa(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/cspa/",
      body_opts: Keyword.take(opts, [:characters]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Bulk delete contacts

  ## Swagger

  The Swagger Operation ID for this function is `delete_characters_character_id_contacts`

  ## Options

  - `:contact_ids` (REQUIRED) -- A list of contacts to edit
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_contact_opts :: [
    contact_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec delete_contact(character_id :: integer, opts :: delete_contact_opts) :: ESI.Request.t
  def delete_contact(character_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/contacts/",
      body_opts: Keyword.take(opts, [:contact_ids]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return contacts of a character

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_contacts`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:page` (DEFAULT: `1`) -- page integer
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type contacts_opts :: [
    datasource: nil | :tranquility | :singularity,
    page: nil | integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec contacts(character_id :: integer, opts :: contacts_opts) :: ESI.Request.t
  def contacts(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/",
      query_opts: Keyword.take(opts, [:datasource, :page, :token, :user_agent]),
    }
  end

  @doc """
  Bulk add contacts with same settings

  ## Swagger

  The Swagger Operation ID for this function is `post_characters_character_id_contacts`

  ## Options

  - `:contact_ids` (REQUIRED) -- A list of contacts to add
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the new contact
  - `:standing` (REQUIRED) -- Standing for the new contact
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  - `:watched` (DEFAULT: `false`) -- Whether the new contact should be watched, note this is only effective on characters
  """
  @type create_contact_opts :: [
    contact_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    label_id: nil | integer,
    standing: float,
    token: nil | String.t,
    user_agent: nil | String.t,
    watched: nil | boolean,
  ]
  # [:word, :arg]
  @spec create_contact(character_id :: integer, opts :: create_contact_opts) :: ESI.Request.t
  def create_contact(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/contacts/",
      body_opts: Keyword.take(opts, [:contact_ids]),
      query_opts: Keyword.take(opts, [:datasource, :label_id, :standing, :token, :user_agent, :watched]),
    }
  end

  @doc """
  Bulk edit contacts with same settings

  ## Swagger

  The Swagger Operation ID for this function is `put_characters_character_id_contacts`

  ## Options

  - `:contact_ids` (REQUIRED) -- A list of contacts to edit
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:label_id` (DEFAULT: `0`) -- Add a custom label to the contact, use 0 for clearing label
  - `:standing` (REQUIRED) -- Standing for the contact
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  - `:watched` (DEFAULT: `false`) -- Whether the contact should be watched, note this is only effective on characters
  """
  @type update_contact_opts :: [
    contact_ids: [nil | integer],
    datasource: nil | :tranquility | :singularity,
    label_id: nil | integer,
    standing: float,
    token: nil | String.t,
    user_agent: nil | String.t,
    watched: nil | boolean,
  ]
  # [:word, :arg]
  @spec update_contact(character_id :: integer, opts :: update_contact_opts) :: ESI.Request.t
  def update_contact(character_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/contacts/",
      body_opts: Keyword.take(opts, [:contact_ids]),
      query_opts: Keyword.take(opts, [:datasource, :label_id, :standing, :token, :user_agent, :watched]),
    }
  end

  @doc """
  A list of the character's clones

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_clones`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type clones_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec clones(character_id :: integer, opts :: clones_opts) :: ESI.Request.t
  def clones(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/clones/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return all mailing lists that the character is subscribed to

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_mail_lists`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type mail_lists_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word, :arg]
  @spec mail_lists(character_id :: integer, opts :: mail_lists_opts) :: ESI.Request.t
  def mail_lists(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/lists/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return custom labels for contacts the character defined

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_contacts_labels`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type contact_labels_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word, :arg]
  @spec contact_labels(character_id :: integer, opts :: contact_labels_opts) :: ESI.Request.t
  def contact_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/contacts/labels/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  List all trained skills for the given character

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_skills`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type skills_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec skills(character_id :: integer, opts :: skills_opts) :: ESI.Request.t
  def skills(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/skills/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return a list of character's recent kills and losses

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_killmails_recent`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:max_count` (DEFAULT: `50`) -- How many killmails to return at maximum
  - `:max_kill_id` -- Only return killmails with ID smaller than this.

  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type killmail_recent_opts :: [
    datasource: nil | :tranquility | :singularity,
    max_count: nil | integer,
    max_kill_id: nil | integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word, :arg]
  @spec killmail_recent(character_id :: integer, opts :: killmail_recent_opts) :: ESI.Request.t
  def killmail_recent(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/killmails/recent/",
      query_opts: Keyword.take(opts, [:datasource, :max_count, :max_kill_id, :token, :user_agent]),
    }
  end

  @doc """
  Get 50 event summaries from the calendar. If no event ID is given,

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_calendar`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:from_event` -- The event ID to retrieve events from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type calendar_opts :: [
    datasource: nil | :tranquility | :singularity,
    from_event: nil | integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec calendar(character_id :: integer, opts :: calendar_opts) :: ESI.Request.t
  def calendar(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/",
      query_opts: Keyword.take(opts, [:datasource, :from_event, :token, :user_agent]),
    }
  end

  @doc """
  Returns full details on the layout of a single planetary colony, including links, pins and routes. Note: Planetary information is only recalculated when the colony is viewed through the client. Information on this endpoint will not update until this criteria is met.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_planets_planet_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type get_characters_character_id_planets_planet_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec get_characters_character_id_planets_planet_id(character_id :: integer, planet_id :: integer, opts :: get_characters_character_id_planets_planet_id_opts) :: ESI.Request.t
  def get_characters_character_id_planets_planet_id(character_id, planet_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/planets/#{planet_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Get portrait urls for a character

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_portrait`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type portrait_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec portrait(character_id :: integer, opts :: portrait_opts) :: ESI.Request.t
  def portrait(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/portrait/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Return the 50 most recent mail headers belonging to the character that match the query criteria. Queries can be filtered by label, and last_mail_id can be used to paginate backwards.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_mail`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:labels` -- Fetch only mails that match one or more of the given labels
  - `:last_mail_id` -- List only mail with an ID lower than the given ID, if present
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type mail_opts :: [
    datasource: nil | :tranquility | :singularity,
    labels: nil | [nil | integer],
    last_mail_id: nil | integer,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec mail(character_id :: integer, opts :: mail_opts) :: ESI.Request.t
  def mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/",
      query_opts: Keyword.take(opts, [:datasource, :labels, :last_mail_id, :token, :user_agent]),
    }
  end

  @doc """
  Create and send a new mail

  ## Swagger

  The Swagger Operation ID for this function is `post_characters_character_id_mail`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:mail` (REQUIRED) -- The mail to send
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_mail_opts :: [
    datasource: nil | :tranquility | :singularity,
    mail: [approved_cost: nil | integer, body: nil | String.t, recipients: nil | [nil | [recipient_id: nil | integer, recipient_type: nil | :alliance | :character | :corporation | :mailing_list]], subject: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec create_mail(character_id :: integer, opts :: create_mail_opts) :: ESI.Request.t
  def create_mail(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/",
      body_opts: Keyword.take(opts, [:mail]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Delete a fitting from a character

  ## Swagger

  The Swagger Operation ID for this function is `delete_characters_character_id_fittings_fitting_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_delete_characters_character_id_fittings_fitting_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec delete_delete_characters_character_id_fittings_fitting_id(character_id :: integer, fitting_id :: integer, opts :: delete_delete_characters_character_id_fittings_fitting_id_opts) :: ESI.Request.t
  def delete_delete_characters_character_id_fittings_fitting_id(character_id, fitting_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/fittings/#{fitting_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Get all the information for a specific event

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_calendar_event_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type get_characters_character_id_calendar_event_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec get_characters_character_id_calendar_event_id(character_id :: integer, event_id :: integer, opts :: get_characters_character_id_calendar_event_id_opts) :: ESI.Request.t
  def get_characters_character_id_calendar_event_id(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/calendar/#{event_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Set your response status to an event

  ## Swagger

  The Swagger Operation ID for this function is `put_characters_character_id_calendar_event_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:response` (REQUIRED) -- The response value to set, overriding current value.
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_put_characters_character_id_calendar_event_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    response: [response: nil | :accepted | :declined | :tentative],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec update_put_characters_character_id_calendar_event_id(character_id :: integer, event_id :: integer, opts :: update_put_characters_character_id_calendar_event_id_opts) :: ESI.Request.t
  def update_put_characters_character_id_calendar_event_id(character_id, event_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/calendar/#{event_id}/",
      body_opts: Keyword.take(opts, [:response]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  List your wallets and their balances. Characters typically have only one wallet, with wallet_id 1000 being the master wallet.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_wallets`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type wallets_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec wallets(character_id :: integer, opts :: wallets_opts) :: ESI.Request.t
  def wallets(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/wallets/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Get a list of all the corporations a character has been a member of

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_corporationhistory`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type corporation_history_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec corporation_history(character_id :: integer, opts :: corporation_history_opts) :: ESI.Request.t
  def corporation_history(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/corporationhistory/",
      query_opts: Keyword.take(opts, [:datasource, :user_agent]),
    }
  end

  @doc """
  Information about the characters current location. Returns the current solar system id, and also the current station or structure ID if applicable.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_location`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type location_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :arg]
  @spec location(character_id :: integer, opts :: location_opts) :: ESI.Request.t
  def location(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/location/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return a list of the users mail labels, unread counts for each label and a total unread count.

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_mail_labels`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type mail_labels_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word, :arg]
  @spec mail_labels(character_id :: integer, opts :: mail_labels_opts) :: ESI.Request.t
  def mail_labels(character_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/labels/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Create a mail label

  ## Swagger

  The Swagger Operation ID for this function is `post_characters_character_id_mail_labels`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:label` -- Label to create
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type create_mail_label_opts :: [
    datasource: nil | :tranquility | :singularity,
    label: nil | [color: nil | :"#ffffff" | :"#ffff01" | :"#ff6600" | :"#fe0000" | :"#9a0000" | :"#660066" | :"#0000fe" | :"#0099ff" | :"#01ffff" | :"#00ff33" | :"#349800" | :"#006634" | :"#666666" | :"#999999" | :"#e6e6e6" | :"#ffffcd" | :"#99ffff" | :"#ccff9a", name: nil | String.t],
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:word, :word, :arg]
  @spec create_mail_label(character_id :: integer, opts :: create_mail_label_opts) :: ESI.Request.t
  def create_mail_label(character_id, opts \\ []) do
    %ESI.Request{
      verb: :post,
      path: "/characters/#{character_id}/mail/labels/",
      body_opts: Keyword.take(opts, [:label]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Delete a mail

  ## Swagger

  The Swagger Operation ID for this function is `delete_characters_character_id_mail_mail_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type delete_delete_characters_character_id_mail_mail_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec delete_delete_characters_character_id_mail_mail_id(character_id :: integer, mail_id :: integer, opts :: delete_delete_characters_character_id_mail_mail_id_opts) :: ESI.Request.t
  def delete_delete_characters_character_id_mail_mail_id(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :delete,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Return the contents of an EVE mail

  ## Swagger

  The Swagger Operation ID for this function is `get_characters_character_id_mail_mail_id`

  ## Options

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type get_characters_character_id_mail_mail_id_opts :: [
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec get_characters_character_id_mail_mail_id(character_id :: integer, mail_id :: integer, opts :: get_characters_character_id_mail_mail_id_opts) :: ESI.Request.t
  def get_characters_character_id_mail_mail_id(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end

  @doc """
  Update metadata about a mail

  ## Swagger

  The Swagger Operation ID for this function is `put_characters_character_id_mail_mail_id`

  ## Options

  - `:contents` (REQUIRED) -- Data used to update the mail
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type update_put_characters_character_id_mail_mail_id_opts :: [
    contents: [labels: nil | [nil | integer], read: nil | boolean],
    datasource: nil | :tranquility | :singularity,
    token: nil | String.t,
    user_agent: nil | String.t,
  ]
  # [:arg, :word, :arg]
  @spec update_put_characters_character_id_mail_mail_id(character_id :: integer, mail_id :: integer, opts :: update_put_characters_character_id_mail_mail_id_opts) :: ESI.Request.t
  def update_put_characters_character_id_mail_mail_id(character_id, mail_id, opts \\ []) do
    %ESI.Request{
      verb: :put,
      path: "/characters/#{character_id}/mail/#{mail_id}/",
      body_opts: Keyword.take(opts, [:contents]),
      query_opts: Keyword.take(opts, [:datasource, :token, :user_agent]),
    }
  end
end