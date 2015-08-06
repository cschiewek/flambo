defmodule Mix.Tasks.Flambo do
  defmodule Secret do
    use Mix.Task
    @shortdoc "Generate required .secret.exs configs"

    def run(_args) do
      Mix.Tasks.Flambo.Secret.Local.run(_args)
    end
  end
end
