defmodule ESI.API.Industry do

  @type facilities_result :: [[facility_id: integer, owner_id: integer, region_id: integer, solar_system_id: integer, tax: nil | float, type_id: integer]]


  @doc """
  Return a list of industry facilities.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`facilities_result`](#t:facilities_result/0) type.

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

  @type systems_result :: [[cost_indices: [[activity: :none | :manufacturing | :researching_technology | :researching_time_efficiency | :researching_material_efficiency | :copying | :duplicating | :invention | :reverse_engineering, cost_index: float]], solar_system_id: integer]]


  @doc """
  Return cost indices for solar systems.

  ## Request Result

  See `ESI.request/2` and `ESI.request!/2`, which can return a [`systems_result`](#t:systems_result/0) type.

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