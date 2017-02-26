defmodule ESI.API.Industry do

  @typedoc """
Options for [`Industry.facilities/1`](#facilities/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type facilities_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return a list of industry facilities.

  ## Response Example

  A list of prices:

      [%{"facility_id" => 60012544, "owner_id" => 1000126, "region_id" => 10000001,
         "solar_system_id" => 30000032, "tax" => 0.1, "type_id" => 2502}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_industry_facilities`
  - `path` -- `/industry/facilities/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_industry_facilities)

  """
  @spec facilities(opts :: facilities_opts) :: ESI.Request.t
  def facilities(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/industry/facilities/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end

  @typedoc """
Options for [`Industry.systems/1`](#systems/1).

  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type systems_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
  ]


  @doc """
  Return cost indices for solar systems.

  ## Response Example

  A list of cost indicies:

      [%{"cost_indices" => [%{"activity" => "invention",
            "cost_index" => 0.00480411064973412}], "solar_system_id" => 30011392}]

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_industry_systems`
  - `path` -- `/industry/systems/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Industry/get_industry_systems)

  """
  @spec systems(opts :: systems_opts) :: ESI.Request.t
  def systems(opts \\ []) do
    %ESI.Request{
      verb: :get,
      path: "/industry/systems/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}},
      opts: Map.new(opts),
    }
  end
end