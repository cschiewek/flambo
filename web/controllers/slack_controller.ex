defmodule Flambo.SlackController do
  use Flambo.Web, :controller
  @token Application.get_env(:flambo, Flambo.Endpoint)[:token]
  plug :action

  def index(conn, %{ "token" => token }) when token != @token do
    conn
    |> put_status(403)
    |> json %{ text: "" }
  end

  def index(conn, params) do
    payload = params["text"] |> String.replace("#{params["trigger_word"]} ", "")
    [ function | fn_params ] = Flambo.Commands.find(payload)
    text = function.(fn_params, params["user_name"])
    json conn, %{ text: text }
  end
end
