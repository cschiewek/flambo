use Mix.Config

File.exists?("config/local.secret.exs") && import_config "local.secret.exs"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :flambo, Flambo.Endpoint,
  http: [port: 4001],
  token: "token",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
