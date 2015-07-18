defmodule Flambo.Commands do
  def valid do
    [
      [ ~r(hi), &hi/2 ]
    ]
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

  def hi(_message, user) do
    "Why hello there #{user}!"
  end

  def command_not_found(_message, user) do
    "Sorry #{user}! I don't know how to do that."
  end
end
