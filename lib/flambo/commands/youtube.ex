defmodule Flambo.Commands.YouTube do
  def key do
    [ ~r/youtube|watch/, &youtube/2 ]
  end

  def youtube(message, _user) do
    terms = message |> List.first
    %{ text: YouTube.search(terms) }
  end
end
