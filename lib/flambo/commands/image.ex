defmodule Flambo.Commands.Image do
  alias Flambo.Services.GoogleImage

  def key do
    [ ~r/image|show/, &image/3 ]
  end

  def image(message, _user, _trigger) do
    GoogleImage.random(message)
  end
end
