defmodule ESI.Request do
  @enforce_keys [
    :verb,
    :path
  ]

  defstruct [
    :verb,
    :path,
    opts_schema: %{},
    opts: %{}
  ]

  @type t :: %__MODULE__{
          verb: :get | :post | :put | :delete,
          path: String.t(),
          opts_schema: %{atom => {:body | :query, :required | :optional}},
          opts: %{atom => any}
        }

  @typedoc """
  Additional request options.

  You can provide any options that the API accepts, and/or these common options:

  - `datasource` -- (DEFAULT: :tranquility) — The server name you would like data from
  - `user_agent` -- Client identifier

  """
  @type request_opts :: [request_opt]
  @type request_opt ::
          {:datasource, :tranquility | :singularity} | {:user_agent, String.t()} | {atom, any}

  @doc """
  Add query options to a request
  """
  @spec options(req :: ESI.Request.t(), opts :: request_opts) :: ESI.Request.t()
  def options(req, []) do
    req
  end

  def options(req, opts) do
    %{req | opts: Map.merge(req.opts, Map.new(opts))}
  end

  @base "https://esi.evetech.net/latest"
  @doc """
  Run a request.
  """
  @spec run(t) :: {:ok, any} | {:error, any}
  def run(request) do
    case validate(request) do
      :ok ->
        do_run(request)

      other ->
        other
    end
  end

  @doc """
  Validate that the request is ready.
  """
  @spec validate(request :: t) :: :ok | {:error, String.t()}
  def validate(request) do
    Enum.reduce(request.opts_schema, [], fn
      {key, {_, :required}}, acc ->
        case Map.has_key?(request.opts, key) do
          true ->
            acc

          false ->
            [key | acc]
        end

      _, acc ->
        acc
    end)
    |> case do
      [] ->
        :ok

      [missing_one] ->
        {:error, "missing option `#{inspect(missing_one)}`"}

      missing_many ->
        detail = Enum.map(missing_many, &"`#{inspect(&1)}`") |> Enum.join(", ")
        {:error, "missing options #{detail}"}
    end
  end

  defp do_run(request) do
    encoded_opts = encode_options(request)
    url = @base <> request.path <> encoded_opts.query

    case :hackney.request(request.verb, url, [], encoded_opts.body, [
           :with_body,
           follow_redirect: true,
           recv_timout: 30_000
         ]) do
      {:ok, code, _headers, body} when code in 200..299 ->
        Poison.decode(body)

      {:ok, 404, _, body} ->
        case Poison.decode(body) do
          {:ok, %{"error" => eve_error}} ->
            {:error, eve_error}

          _ ->
            {:error, "HTTP 404"}
        end

      {:ok, code, _, _} ->
        {:error, "HTTP #{code}"}

      {:error, :timeout} ->
        {:error, "timeout"}
    end
  end

  @spec opts_by_location(request :: t) :: %{(:body | :query) => %{atom => any}}
  def opts_by_location(request) do
    Enum.reduce(request.opts, %{body: %{}, query: %{}}, fn {key, value}, acc ->
      case Map.get(request.opts_schema, key) do
        {location, _} ->
          update_in(acc, [location], &Map.put(&1, key, value))

        _ ->
          acc
      end
    end)
  end

  @spec encode_options(request :: t) :: %{(:body | :query) => String.t()}
  def encode_options(request) do
    opts = opts_by_location(request)

    %{
      body: encode_options(:body, opts.body),
      query: encode_options(:query, opts.query)
    }
  end

  @spec encode_options(:body | :query, opts :: map) :: String.t()
  defp encode_options(:body, opts) when map_size(opts) == 0, do: ""
  # In the body, only support one option and just encode the value
  defp encode_options(:body, opts), do: Poison.encode!(opts |> Map.values() |> hd)
  defp encode_options(:query, opts) when map_size(opts) == 0, do: ""
  defp encode_options(:query, opts), do: "?" <> URI.encode_query(opts)

  def stream!(%{opts_schema: %{page: _}} = request) do
    request_fun = fn page ->
      options(request, page: page)
      |> run
    end

    first_page = Map.get(request.opts, :page, 1)

    Stream.resource(
      fn -> {request_fun, first_page} end,
      fn
        :quit ->
          {:halt, nil}

        {fun, page} ->
          case fun.(page) do
            {:ok, []} ->
              {[], :quit}

            {:ok, data} when is_list(data) ->
              {data, {fun, page + 1}}

            {:ok, data} ->
              {[data], :quit}

            {:error, err} ->
              raise err
          end
      end,
      & &1
    )
  end

  def stream!(request) do
    Stream.resource(
      fn -> request end,
      fn
        :quit ->
          {:halt, nil}

        request ->
          case run(request) do
            {:ok, data} ->
              {List.wrap(data), :quit}

            {:error, err} ->
              raise err
          end
      end,
      & &1
    )
  end
end
