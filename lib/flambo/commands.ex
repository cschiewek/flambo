defmodule Flambo.Commands do
  def valid do
    [ Flambo.Commands.Hi.key,
      Flambo.Commands.WhoAreYou.key,
      Flambo.Commands.Help.key,
      Flambo.Commands.Gif.key,
      Flambo.Commands.Tell.key,
      Flambo.Commands.Image.key,
      Flambo.Commands.Bomb.key ]
  end

  def find(payload) do
    command = valid |> Enum.find(
      fn(i) ->
        List.first(i)
        |> Regex.match?(payload)
      end
    )
    function = command && List.last(command) || &command_not_found/2
    params = if command do
      String.replace(payload, List.first(command) |> Regex.run(payload), "")
      |> String.strip
    else
      ""
    end
    [function, params]
  end

  def command_not_found(_message, user) do
    %{ text: "Sorry #{user}! I don't know how to do that." }
  end
end
