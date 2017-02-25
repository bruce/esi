defmodule ESI do

  @typedoc """
  - `:datasource` (DEFAULT: `:tranquility`) -- The server name you would like data from
  - `:token` -- Access token to use, if preferred over a header
  - `:user_agent` -- Client identifier, takes precedence over headers
  """
  @type request_opts :: [
    datasource: nil | :tranquility | :singularity,
    user_agent: nil | String.t,
    token: nil | String.t,
  ]

  @doc """
  Add query options to a request
  """
  @spec options(req :: ESI.Request.t, opts :: request_opts) :: ESI.Request.t
  def options(req, []) do
    req
  end
  def options(req, opts) do
    %{req | query_opts: Keyword.merge(req.query_opts, opts)}
  end

  @spec request!(req :: ESI.Request.t, opts :: request_opts) :: {:ok, any} | {:error, any}
  def request(req, opts \\ []) do
    req
    |> options(opts)
    |> do_request
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

  @base "https://esi.tech.ccp.is/latest"
  def do_request(request) do
    query = URI.encode_query(request.query_opts)
    url = "#{@base}#{request.path}?#{query}"
    case :hackney.request(request.verb, url, [], "", [:with_body, follow_redirect: true, recv_timout: 30_000]) do
      {:ok, code, _headers, body} when code in 200..299 ->
        Poison.decode(body)
      {:ok, 404, _, body} ->
        case Poison.decode(body) do
          {:ok, %{"error" => eve_error}} ->
            {:error, eve_error}
          _ ->
            {:error, "Bad ESI HTTP response: 404"}
        end
      {:ok, code, _, _} ->
        {:error, "Bad ESI HTTP response: #{code}"}
      {:error, :timeout} ->
        {:error, "ESI Timeout"}
    end
  end

end
