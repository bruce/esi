defmodule ESI.Request do

  @enforce_keys [
    :verb,
    :path
  ]

  defstruct [
    :verb,
    :path,
    query_opts: [],
    body_opts: [],
    header_opts: []
  ]

  @type t :: %__MODULE__{
    verb: :get | :post | :put | :delete,
    path: String.t,
    query_opts: Keyword.t,
    body_opts: Keyword.t,
    header_opts: Keyword.t,
  }

end