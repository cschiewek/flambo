defmodule Flambo.Commands.WakeUp do
  def key do
    [ ~r/^wake up/, &wake_up/3 ]
  end

  def wake_up(_message, user, _trigger) do
    %{ text: "I'm awake #{user}, what can I do for you?" }
  end
end
