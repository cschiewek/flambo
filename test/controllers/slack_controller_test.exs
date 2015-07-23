defmodule Flambo.SlackControllerTest do
  use Flambo.ConnCase
  @base_params [token: "token", trigger_word: "flambo", user_name: "Finn"]

  test "GET /" do
    conn = get conn(), "/"
    assert response(conn, 404)
  end

  test "POST / with invalid token" do
    conn = post conn(), "/", [token: ""]
    assert response(conn, 403)
  end

  test "POST / with unknown command" do
    conn = post conn(), "/", @base_params ++ [text: "flambo mathmatical"]
    assert conn.resp_body =~ "Sorry Finn! I don't know how to do that."
  end

  test "POST / with hi" do
    conn = post conn(), "/", @base_params ++ [text: "flambo hi"]
    assert conn.resp_body =~ "Why hello there Finn!"
  end

  test "POST / with help" do
    conn = post conn(), "/", @base_params ++ [text: "flambo help"]
    assert response(conn, 200)
  end

  test "POST / with who are you" do
    conn = post conn(), "/", @base_params ++ [text: "flambo who are you"]
    assert response(conn, 200)
  end

  test "POST / with tell" do
    conn = post conn(), "/", @base_params ++ [text: "flambo tell @iceking not cool"]
    assert conn.resp_body =~ "@iceking not cool"
  end

  test "POST / with gif" do
    conn = post conn(), "/", @base_params ++ [text: "flambo gif princess bubblegum"]
    assert response(conn, 200)
  end

  test "POST / with image" do
    conn = post conn(), "/", @base_params ++ [text: "flambo image lady rainicorn"]
    assert response(conn, 200)
  end
end
