defmodule Flambo.Commands.Tell do
  def key do
    [ ~r/^tell|^say/, &tell/3 ]
  end

  def tell(message, _user, _trigger) do
    %{ text: message }
  end
end
