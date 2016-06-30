defmodule Flambo.Commands.YouTube do
  alias Flambo.Services.YouTube

  def key do
    [ ~r/youtube|watch/, &youtube/3 ]
  end

  def youtube(message, _user, _trigger) do
    YouTube.search(message)
  end
end
