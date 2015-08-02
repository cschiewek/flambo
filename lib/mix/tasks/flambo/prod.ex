defmodule Mix.Tasks.Flambo.Secret.Prod do
  use Mix.Task
  import Mix.Generator
  @shortdoc "Generate required prod.secret.exs config"

  def run(_args) do
    model_destination = Path.join(System.cwd(), "config/prod.secret.exs")
    create_file model_destination, prod_template(nil)
  end

  embed_template :prod, """
  use Mix.Config

  config :flambo, Flambo.Endpoint,
    http: [port: 5001],
    url: [host: ""],
    secret_key_base: "",
    token: "",
    imgur_client_id: ""

  # Configure your database
  config :flambo, Flambo.Repo,
    adapter: Ecto.Adapters.Postgres,
    username: "postgres",
    password: "postgres",
    database: "flambo",
    size: 20 # The amount of database connections in the pool
  """
end
