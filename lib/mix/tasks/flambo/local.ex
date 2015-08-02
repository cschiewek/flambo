defmodule Mix.Tasks.Flambo.Secret.Local do
  use Mix.Task
  import Mix.Generator
  @shortdoc "Generate required local.secret.exs config"

  def run(_args) do
    model_destination = Path.join(System.cwd(), "config/local.secret.exs")
    create_file model_destination, local_template(nil)
  end

  embed_template :local, """
  use Mix.Config

  config :flambo, Flambo.Endpoint,
    token: "",
    giphy_key: "dc6zaTOxFJmzC",
    imgur_client_id: ""
  """
end
