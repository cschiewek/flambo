defmodule Flambo.Commands.WhoAreYou do
  def key do
    [ ~r/^who are you/, &who_are_you/3 ]
  end

  def who_are_you(_message, _user, _trigger) do
    """
    I'm Flambo! A humble slack bot, flambit, and denizen of the Fire Kingdom!
    https://youtu.be/YfdrXz4xtKQ?t=25s
    """
  end
end
