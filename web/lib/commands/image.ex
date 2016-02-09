defmodule Flambo.Commands.Image do
  def key do
    [ ~r/image|show/, &image/3 ]
  end

  def image(message, _user, _trigger) do
    terms = message |> List.first
    %{ text: GoogleImage.random(terms) }
  end
end
