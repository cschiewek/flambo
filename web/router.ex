defmodule Flambo.Router do
  use Flambo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Flambo do
    pipe_through :api
    post "/", SlackController, :index
  end
end
