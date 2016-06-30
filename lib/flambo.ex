defmodule Flambo do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    Logger.add_backend(ExSentry.LoggerBackend)

    children = [
      # Start the Slack app when the application starts
      worker(Flambo.Slack, [Application.get_env(:flambo, :slack_api_token), []])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Flambo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
