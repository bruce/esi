defmodule ESI.API.Status do
  @doc """
  EVE Server status.

  ## Response Example

  Server status:

      %{
        "players" => 12345,
        "server_version" => "1132976",
        "start_time" => "2017-01-02T12:34:56Z"
      }

  ## Swagger Source

  This function was generated from the following Swagger operation:

  - `operationId` -- `get_status`
  - `path` -- `/status/`

  [View on ESI Site](https://esi.tech.ccp.is/latest/#!/Status/get_status)

  """
  @spec status() :: ESI.Request.t()
  def status() do
    %ESI.Request{
      verb: :get,
      path: "/status/",
      opts_schema: %{datasource: {:query, :optional}, user_agent: {:query, :optional}}
    }
  end
end
