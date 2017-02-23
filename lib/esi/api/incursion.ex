defmodule ESI.API.Incursion do

  @type incursions_result :: [[constellation_id: integer, faction_id: integer, has_boss: boolean, infested_solar_systems: [integer], influence: float, staging_solar_system_id: integer, state: String.t, type: String.t]]


  @doc """
  Return a list of current incursions.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`incursions_result`](#t:incursions_result/0) type.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_incursions`
  - `path` -- `/incursions/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Incursions/get_incursions)

  """
  @spec incursions() :: ESI.Request.t
  def incursions() do
    %ESI.Request{
      verb: :get,
      path: "/incursions/",

    }
  end
end