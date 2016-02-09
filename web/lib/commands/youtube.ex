defmodule Flambo.Commands.YouTube do
  def key do
    [ ~r/youtube|watch/, &youtube/3 ]
  end

  def youtube(message, _user, _trigger) do
    terms = message |> List.first
    %{ text: YouTube.search(terms) }
  end
end
