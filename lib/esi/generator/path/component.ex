defmodule ESI.Generator.Path.Component do
  @moduledoc false

  @enforce_keys [
    :kind,
    :value,
  ]

  defstruct [
    :kind,
    :value,
  ]

  @type t :: %__MODULE__{
    kind: :arg | :word,
    value: String.t,
  }

  def arg(value) do
    %__MODULE__{kind: :arg, value: value}
  end

  def word(value) do
    %__MODULE__{kind: :word, value: value}
  end

end