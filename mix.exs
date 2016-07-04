defmodule Flambo.Mixfile do
  use Mix.Project

  def project do
    [app: :flambo,
     version: "0.4.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    default_applications = [:logger, :slack, :websocket_client]
    applications = case Mix.env do
      :prod -> default_applications ++ [:exsentry]
      _ -> default_applications
    end
    [mod: {Flambo, []},
     applications: applications]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:slack, "~> 0.6.0"},
     {:websocket_client, git: "https://github.com/jeremyong/websocket_client"},
     {:edeliver, "~> 1.2.10"},
     {:exsentry, "~> 0.6.2"}]
  end
end
