# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

File.exists?("config/#{Mix.env}.secret.exs") && import_config "#{Mix.env}.secret.exs"
