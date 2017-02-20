defmodule ESI do

  def request(req) do
    req
    |> do_request
  end

  def request!(req) do
    case request(req) do
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
      {:ok, code, _, _} ->
        {:error, "Bad ESI HTTP response: #{code}"}
      {:error, :timeout} ->
        {:error, "ESI Timeout"}
    end
  end

end
