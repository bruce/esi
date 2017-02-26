defmodule ESI.API.Incursion do

  @typedoc """
Options for [`Incursion.incursions/1`](#incursions/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type incursions_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of current incursions.

  ## Response Example

  A list of incursions:

      [%{"constellation_id" => 20000607, "faction_id" => 500019, "has_boss" => true,
         "infested_solar_systems" => [30004148, 30004149, 30004150, 30004151,
          30004152, 30004153, 30004154], "influence" => 1.0,
         "staging_solar_system_id" => 30004154, "state" => "mobilizing",
         "type" => "Incursion"}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_incursions`
  - `path` -- `/incursions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Incursions/get_incursions)

  """
  @spec incursions(opts :: incursions_opts) :: ESI.Request.t
  def incursions(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/incursions/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end