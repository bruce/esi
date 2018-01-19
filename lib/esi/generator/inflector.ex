defmodule ESI.Generator.Inflector do
  @moduledoc false

  @custom_titleize %{
    "ui" => "UI"
  }
  for {name, mod_name} <- @custom_titleize do
    def titleize(unquote(name)) do
      unquote(mod_name)
    end
  end

  def titleize(name) do
    Macro.camelize(name)
  end

  @custom_singularize %{
    "categories" => "category"
  }
  for {name, mod_name} <- @custom_singularize do
    def singularize(unquote(name)) do
      unquote(mod_name)
    end
  end

  def singularize(word) do
    String.replace_suffix(word, "s", "")
  end
end
