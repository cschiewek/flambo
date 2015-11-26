defmodule Flambo.SlackController do
  use Flambo.Web, :controller
  @token Application.get_env(:flambo, Flambo.Endpoint)[:token]

  def index(conn, _params) do
    json conn, %{ flambo: %{ version: Application.get_env(:flambo, Flambo.Endpoint)[:version] } }
  end

  def command(conn, %{ "token" => token }) when token != @token do
    conn
    |> put_status(403)
    |> json %{ text: "" }
  end

  def command(conn, params) do
    trigger = params["trigger_word"]
    payload = params["text"] |> String.replace("#{trigger} ", "")
    [ function | arguments ] = Flambo.Commands.find(payload)
    json conn, function.(arguments, params["user_name"], trigger)
  end
end
