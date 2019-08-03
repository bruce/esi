defmodule ESI do
  @doc """
  Execute a request.

  ## Arguments

  - `request` -- the request
  - `opts` -- any additional options to set on the request
  """
  @spec request!(req :: ESI.Request.t(), opts :: ESI.Request.request_opts()) ::
          {:ok, any} | {:error, any}
  def request(req, opts \\ []) do
    req
    |> ESI.Request.options(opts)
    |> ESI.Request.run()
  end

  @doc """
  Execute a request and raise an error if it is not successful.
  """
  @spec request!(req :: ESI.Request.t(), opts :: ESI.Request.request_opts()) :: any
  def request!(req, opts \\ []) do
    case request(req, opts) do
      {:ok, result} ->
        result

      {:error, err} ->
        raise "Request failed: #{err}"
    end
  end

  @doc """
  Generate a stream from a request, supporting automatic pagination.

  ## Examples

  Paginating, without `stream!`; you need to manually handle incrementing the
  `:page` option:

      iex> ESI.API.Universe.groups() |> ESI.request! |> length
      1000
      iex> ESI.API.Universe.groups(page: 2) |> ESI.request! |> length
      394

  Paginating with `stream!`, you don't have to care about `:page`:

      iex> ESI.API.Universe.groups() |> ESI.stream! |> Enum.take(1020) |> length
      1020

  Like any stream, you can use `Enum.to_list/1` to get all the items:

      iex> ESI.API.Universe.groups() |> ESI.stream! |> Enum.to_list |> length
      1394

  It even works for requests that don't paginate:

      iex> ESI.API.Universe.bloodlines() |> ESI.stream! |> Enum.to_list |> length
      18

  """
  @spec stream!(req :: ESI.Request.t(), opts :: ESI.Request.request_opts()) :: any
  def stream!(req, opts \\ []) do
    req
    |> ESI.Request.options(opts)
    |> ESI.Request.stream!()
  end
end
