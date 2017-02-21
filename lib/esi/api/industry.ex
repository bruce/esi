defmodule ESI.API.Industry do

  @doc """
  Return a list of industry facilities.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_industry_facilities`
  - `path` -- `/industry/facilities/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_industry_facilities)

  """
  @spec facilities() :: ESI.Request.t
  def facilities() do
    %ESI.Request{
      verb: :get,
      path: "/industry/facilities/",

    }
  end

  @doc """
  Return cost indices for solar systems.

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_industry_systems`
  - `path` -- `/industry/systems/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_industry_systems)

  """
  @spec systems() :: ESI.Request.t
  def systems() do
    %ESI.Request{
      verb: :get,
      path: "/industry/systems/",

    }
  end
end