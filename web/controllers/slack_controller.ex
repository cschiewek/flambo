defmodule Flambo.SlackController do
  use Flambo.Web, :controller
  @token Application.get_env(:flambo, Flambo.Endpoint)[:token]
  plug :action

  def index(conn, _params) do
    json conn, %{ flambo: %{ version: Flambo.Mixfile.project[:version] } }
  end

  def command(conn, %{ "token" => token }) when token != @token do
    conn
    |> put_status(403)
    |> json %{ text: "" }
  end

  def command(conn, params) do
    payload = params["text"] |> String.replace("#{params["trigger_word"]} ", "")
    [ function | arguments ] = Flambo.Commands.find(payload)
    json conn, function.(arguments, params["user_name"])
  end
end
