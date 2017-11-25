defmodule ESI.Generator.View.Module do
  require EEx

  EEx.function_from_file :def, :render, Path.join(~w(templates module.eex)), [:name, :functions], trim: true

  defp render_function(function) do
    ESI.Generator.View.Function.render(function)
  end

end