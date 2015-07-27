use Mix.Config

import_config "local.secret.exs"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :flambo, Flambo.Endpoint,
  http: [port: 4001],
  token: "token",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :flambo, Flambo.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  username: "postgres",
  password: "postgres",
  database: "flambo_test",
  size: 1 # Use a single connection for transactional tests
