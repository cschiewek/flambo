defmodule Flambo.Commands.Hi do
  def key do
    [ ~r/^hi/, &hi/2 ]
  end

  def hi(_message, user) do
    %{ text: "Why hello there #{user}!" }
  end
end
