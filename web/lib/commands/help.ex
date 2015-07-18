defmodule Flambo.Commands.Help do
  def key do
    [ ~r/^help/, &help/2 ]
  end

  def help(_message, _user) do
    %{ text:
      """
      ```
      fbo hi             says hi
      fbo who are you?   tells you who he is
      fbo help           prints this help message
      ```
      """
    }
  end
end
