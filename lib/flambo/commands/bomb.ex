defmodule Flambo.Commands.Bomb do
  alias Flambo.Services.Imgur

  def key do
    [ ~r/bomb/, &bomb/3 ]
  end

  def bomb(message, _user, _trigger) do
    match = Regex.run(~r/\d+/, message)
    count = case match do
      nil -> 3
      _ -> match |> List.first |> Integer.parse |> elem(0)
    end
    terms = case match do
      nil -> message
      _ -> message |> String.replace(count, "") |> String.strip
    end
    Imgur.random(terms, count) |> Enum.join("\n")
  end
end
