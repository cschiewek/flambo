defmodule Flambo.Commands.Bomb do
  def key do
    [ ~r/bomb/, &bomb/3 ]
  end

  def bomb(message, _user, _trigger) do
    message = message |> List.first
    match = Regex.run(~r/\d+/, message)
    count = case match do
      true -> match |> List.first |> Integer.parse |> elem(0)
      false -> 3
    end
    terms = case match do
      true -> message |> String.replace(count, "") |> String.strip
      false -> message
    end
    %{ text: Imgur.random(terms, count) |> Enum.join("\n") }
  end
end
