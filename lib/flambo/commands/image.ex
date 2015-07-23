defmodule Flambo.Commands.Image do
  def key do
    [ ~r/image|show/, &image/2 ]
  end

  def image(message, _user) do
    terms = message |> List.first
    %{ text: GoogleImage.random(terms) }
  end
end
