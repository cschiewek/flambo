defmodule Flambo.Commands.Gif do
  def key do
    [ ~r/gif/, &gif/2 ]
  end

  def gif(_message, user) do
    %{ text: "Post a GIF!" }
  end
end
