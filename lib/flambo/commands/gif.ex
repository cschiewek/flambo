defmodule Flambo.Commands.Gif do
  def key do
    [ ~r/gif|animate/, &gif/3 ]
  end

  def gif(message, _user, _trigger) do
    terms = message |> List.first
    %{ text: Giphy.random(terms) }
  end
end
