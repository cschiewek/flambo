defmodule Flambo.Commands.Hi do
  def key do
    [ ~r/^hi/, &hi/3 ]
  end

  def hi(_message, user, _trigger) do
    %{ text: "Why hello there #{user}!" }
  end
end
