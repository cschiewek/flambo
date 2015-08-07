defmodule Flambo.Commands.Bomb do
  def key do
    [ ~r/bomb/, &bomb/3 ]
  end

  def bomb(message, _user, _trigger) do
    message = message |> List.first
    match = Regex.run(~r/\d+/, message)
    if match do
      count = match |> List.first
      terms = message |> String.replace(count, "") |> String.strip
      count = count |> Integer.parse |> elem(0)
    else
      [count, terms] = [3, message]
    end
    attachments = %{ text: Imgur.random(terms, count) |> Enum.join("\n") }
  end
end
