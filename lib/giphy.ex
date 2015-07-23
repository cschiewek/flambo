defmodule Giphy do
  use HTTPoison.Base
  @key Application.get_env(:flambo, Flambo.Endpoint)[:giphy_key]

  def random(terms) do
    offset = 0..100 |> Enum.shuffle |> List.first
    results = search(terms, offset)
    if Enum.empty? results do
      "Sorry, I couldn't find a gif for `#{terms}`"
    else
      results
      |> List.first
      |> Map.get("images")
      |> Map.get("original")
      |> Map.get("url")
    end
  end

  def search(terms, offset \\ 0, limit \\ 1) do
    params = %{ api_key: @key, q: terms, offset: offset, limit: limit }
    get!("search", [], params: params).body[:data]
  end

  defp process_url(url) do
    "http://api.giphy.com/v1/gifs/" <> url
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
