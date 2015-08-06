use Mix.Config

# For production, we configure the host to read the PORT
# from the system environment. Therefore, you will need
# to set PORT=80 before running your server.
#
# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
#
# Finally, we also include the path to a manifest
# containing the digested version of static files. This
# manifest is generated by the mix phoenix.digest task
# which you typically run after static files are built.
config :flambo, Flambo.Endpoint,
  http: [port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  token: System.get_env("TOKEN"),
  giphy_key: "dc6zaTOxFJmzC",
  imgur_client_id: System.get_env("IMGUR_CLIENT_ID"),
  google_api_key: System.get_env("GOOGLE_API_KEY"),
  server: true

# Configure your database
config :flambo, Flambo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "",
  password: "",
  database: "",
  size: 20 # The amount of database connections in the pool

# Do not print debug messages in production
config :logger, level: :info
