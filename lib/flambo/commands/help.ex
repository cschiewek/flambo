defmodule Flambo.Commands.Help do
  def key do
    [ ~r/^help/, &help/2 ]
  end

  def help(_message, _user) do
    %{ text:
      """
      ```
      Flambo v#{Flambo.Mixfile.project[:version]}
      -------------------------------------------
      fbo gif            display a random gif
      fbo help           prints this help message
      fbo hi             says hi
      fbo tell           tell someone somethin
      fbo who are you?   tells you who he is
      fbo image          shows a random image
      ```
      """
    }
  end
end
