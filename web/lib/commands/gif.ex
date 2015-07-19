defmodule Flambo.Commands.Gif do
  def key do
    [ ~r/gif|animate/, &gif/2 ]
  end

  def gif(message, _user) do
    terms = message |> List.first |> String.replace(" ", "+")
    %{ text: Flambo.Giphy.random(terms) }
  end
end
