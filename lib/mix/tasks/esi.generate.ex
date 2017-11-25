defmodule Mix.Tasks.Esi.Generate do
  use Mix.Task

  @shortdoc "Regenerates modules based on the Swagger definition"

  @moduledoc """
  Regenerates the ESI.API.* modules based on a priv/swagger.json definition.
  """

  def run(_) do
    Application.ensure_all_started(:esi)
    swagger()
    |> ESI.Generator.run()
  end

  @spec swagger() :: map
  defp swagger() do
    Path.join([:code.priv_dir(:esi), "swagger.json"])
    |> File.read!
    |> Poison.decode!
  end

end
