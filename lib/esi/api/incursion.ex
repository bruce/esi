defmodule ESI.API.Incursion do

  @doc """
  Return a list of current incursions.

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