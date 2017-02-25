defmodule ESI.API.Sovereignty do

  @doc """
  Shows sovereignty data for campaigns..

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_campaigns`
  - `path` -- `/sovereignty/campaigns/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_campaigns)

  """
  @spec campaigns() :: ESI.Request.t
  def campaigns() do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/campaigns/",

    }
  end

  @doc """
  Shows sovereignty data for structures..

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_sovereignty_structures`
  - `path` -- `/sovereignty/structures/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Sovereignty/get_sovereignty_structures)

  """
  @spec structures() :: ESI.Request.t
  def structures() do
    %ESI.Request{
      verb: :get,
      path: "/sovereignty/structures/",

    }
  end
end