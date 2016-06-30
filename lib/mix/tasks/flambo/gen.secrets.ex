defmodule Mix.Tasks.Flambo.Gen.Secrets do
  use Mix.Task
  import Mix.Generator
  @shortdoc "Generate required *.secret.exs config"

  def run(_args) do
    model_destination = Path.join(System.cwd(), "config/#{Mix.env}.secret.exs")
    create_file model_destination, local_template(nil)
  end

  embed_template :local, """
  use Mix.Config

  config :flambo,
    slack_api_token: "",
    giphy_key: "dc6zaTOxFJmzC",
    imgur_client_id: "",
    google_api_key: "",
    google_search_id: ""

    config :exsentry, dsn: ""
  """
end
