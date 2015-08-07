defmodule Flambo.Commands.Help do
  def key do
    [ ~r/^help/, &help/3 ]
  end

  def help(_message, _user, trigger) do
    %{ text:
      """
      ```
      #{trigger} animate        display a random gif
      #{trigger} bomb <n>       displays <n> random images (default for n is 3)
      #{trigger} gif            display a random gif
      #{trigger} help           prints this help message
      #{trigger} hi             says hi
      #{trigger} image          shows a random image
      #{trigger} say            says something
      #{trigger} show           shows a random image
      #{trigger} tell           tell someone something
      #{trigger} watch          displays a youtube video
      #{trigger} who are you?   tells you who he is
      #{trigger} youtube        displays a youtube video
      ```
      """
    }
  end
end
