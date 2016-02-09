defmodule Mix.Tasks.Flambo do
  defmodule Secret do
    use Mix.Task
    @shortdoc "Generate required .secret.exs configs"

    def run(args) do
      Mix.Tasks.Flambo.Secret.Local.run(args)
    end
  end
end
