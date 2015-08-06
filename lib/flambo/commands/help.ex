defmodule Flambo.Commands.Help do
  def key do
    [ ~r/^help/, &help/2 ]
  end

  def help(_message, _user) do
    %{ text:
      """
      ```
      fbo animate        display a random gif
      fbo bomb <n>       displays <n> random images (default for n is 3)
      fbo gif            display a random gif
      fbo help           prints this help message
      fbo hi             says hi
      fbo image          shows a random image
      fbo show           shows a random image
      fbo tell           tell someone something
      fbp watch          displays a youtube video
      fbo who are you?   tells you who he is
      fbo youtube        displays a youtube video
      ```
      """
    }
  end
end
