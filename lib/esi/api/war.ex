defmodule ESI.API.War do
  @typedoc """
  Options for [`War.wars/1`](#wars/1).

  - `:max_war_id` -- Only return wars with ID smaller than this.
  """
  @type wars_opts :: [wars_opt]
  @type wars_opt :: {:max_war_id, nil | integer}

  @doc """
  Return a list of wars.

  ## Response Example

  A list of war IDs, in decending order by war_id.:

      [3, 2, 1]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_wars`
  - `path` -- `/wars/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars)

  """
  @spec wars(opts :: wars_opts) :: ESI.Request.t()
  def wars(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/wars/",
      opts_schema: %{
        datasource: {:query, :optional},
        max_war_id: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @typedoc """
  Options for [`War.killmails/2`](#killmails/2).

  - `:page` (DEFAULT: `1`) -- Which page of results to return
  """
  @type killmails_opts :: [killmails_opt]
  @type killmails_opt :: {:page, nil | integer}

  @doc """
  Return a list of kills related to a war.

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

  - `operationId` -- `get_wars_war_id_killmails`
  - `path` -- `/wars/{war_id}/killmails/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars_war_id_killmails)

  """
  @spec killmails(war_id :: integer, opts :: killmails_opts) :: ESI.Request.t()
  def killmails(war_id, opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/wars/#{war_id}/killmails/",
      opts_schema: %{
        datasource: {:query, :optional},
        page: {:query, :optional},
        user_agent: {:query, :optional}
      },
      opts: Map.new(opts)
    }
  end

  @doc """
  Return details about a war.

  ## Response Example

  Details about a war:

      %{
        "aggressor" => %{
          "corporation_id" => 986665792,
          "isk_destroyed" => 0,
          "ships_killed" => 0
        },
        "declared" => "2004-05-22T05:20:00Z",
        "defender" => %{
          "corporation_id" => 1001562011,
          "isk_destroyed" => 0,
          "ships_killed" => 0
        },
        "id" => 1941,
        "mutual" => false,
        "open_for_allies" => false
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_wars_war_id`
  - `path` -- `/wars/{war_id}/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Wars/get_wars_war_id)

  """
  @spec war(war_id :: integer) :: ESI.Request.t()
  def war(war_id) do
    %ESI.Request{
      verb: :get,
      path: "/wars/#{war_id}/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}}
    }
  end
end
