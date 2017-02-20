defmodule ESI.Generator.Path do

  @enforce_keys [
    :source,
    :components
  ]

  defstruct [
    :source,
    :components
  ]

  @type t :: %__MODULE__{
    source: String.t,
    components: [ESI.Generator.Path.Component.t]
  }

end