defmodule Flambo.Router do
  use Flambo.Web, :router
  use ExSentry.Plug

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Flambo do
    pipe_through :api
    get "/", SlackController, :index
    post "/", SlackController, :command
  end
end
