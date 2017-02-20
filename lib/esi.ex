defmodule ESI do

  def get(path, args) do
    request(:get, path, args)
  end

  def delete(path, args) do
    request(:delete, path, args)
  end

  def post(path, args) do
    request(:post, path, args)
  end

  def put(path, args) do
    request(:put, path, args)
  end

  def format_validation_errors(_errors) do
    "Validation failed"
  end

  @base "https://esi.tech.ccp.is/latest"
  def request(verb, path, args) do
    query = URI.encode_query(args)
    url = "#{@base}#{path}?#{query}"
    case :hackney.request(verb, url, [], "", [:with_body, follow_redirect: true, recv_timout: 30_000]) do
      {:ok, code, headers, body} when code in 200..299 ->
        Poison.decode!(body)
      {:ok, code, _, _} ->
        {:error, "Bad ESI HTTP response: #{code}"}
      {:error, :timeout} ->
        {:error, "ESI Timeout"}
    end
  end

end
