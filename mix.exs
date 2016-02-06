defmodule Flambo.Mixfile do
  use Mix.Project

  def project do
    [app: :flambo,
     version: "0.3.6",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {Flambo, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :httpoison, :exrm, :mandrag]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.1.4"},
     {:phoenix_html, "~> 2.5.0"},
     {:phoenix_live_reload, "~> 1.0.3", only: :dev},
     {:cowboy, "~> 1.0.4"},
     {:httpoison, "~> 0.8.1"},
     {:mandrag, "~> 0.0.13"}]
  end
end
