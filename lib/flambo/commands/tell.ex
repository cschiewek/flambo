defmodule Flambo.Commands.Tell do
  def key do
    [ ~r/^tell/, &tell/2 ]
  end

  def tell(message, _user) do
    %{ text: message }
  end
end
