defmodule Flambo.Commands.Gif do
  alias Flambo.Services.Giphy

  def key do
    [ ~r/gif|animate/, &gif/3 ]
  end

  def gif(message, _user, _trigger) do
    Giphy.random(message)
  end
end
