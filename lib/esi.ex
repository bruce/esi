defmodule ESI do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header.
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type request_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
    token: nil | String.t,
  ]

  @spec request!(req :: ESI.Request.t, opts :: request_opts) :: {:ok, any} | {:error, any}
  def request(req, opts \\ []) do
    req
    |> ESI.Request.options(opts)
    |> ESI.Request.run
  end

  @spec request!(req :: ESI.Request.t, opts :: request_opts) :: any
  def request!(req, opts \\ []) do
    case request(req, opts) do
      {:ok, result} ->
        result
      {:error, err} ->
        raise "Request failed: #{err}"
    end
  end

end
