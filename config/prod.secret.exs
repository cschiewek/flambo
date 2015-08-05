use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :flambo, Flambo.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  token: System.get_env("TOKEN"),
  imgur_client_id: System.get_env("IMGUR_CLIEND_ID")

# Configure your database
config :flambo, Flambo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "",
  password: "",
  database: "",
  size: 20 # The amount of database connections in the pool
