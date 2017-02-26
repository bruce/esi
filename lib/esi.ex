defmodule ESI do

  @doc """
  Execute a request.

  ## Arguments

  - `request` -- the request
  - `opts` -- any additional options to set on the request
  """
  @spec request!(req :: ESI.Request.t, opts :: ESI.Request.request_opts) :: {:ok, any} | {:error, any}
  def request(req, opts \\ []) do
    req
    |> ESI.Request.options(opts)
    |> ESI.Request.run
  end

  @doc """
  Execute a request and raise an error if it is not successful.
  """
  @spec request!(req :: ESI.Request.t, opts :: ESI.Request.request_opts) :: any
  def request!(req, opts \\ []) do
    case request(req, opts) do
      {:ok, result} ->
        result
      {:error, err} ->
        raise "Request failed: #{err}"
    end
  end

end
