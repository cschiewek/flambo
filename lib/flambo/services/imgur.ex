defmodule Flambo.Services.Imgur do
  use HTTPoison.Base
  @client_id Application.get_env(:flambo, :imgur_client_id)

  def random(terms, count \\ 1) do
    results = search(terms)
    if Enum.empty? results do
      "Sorry, I couldn't find an image for `#{terms}`"
    else
      results
      |> Enum.filter(&(&1["is_album"] == false))
      |> Enum.filter(&(&1["nsfw"] != true))
      |> Enum.shuffle
      |> Enum.take(count)
      |> Enum.map(&(Map.get(&1, "link")))
    end
  end

  def search(terms) do
    header = [{"Authorization", "Client-ID #{@client_id}"}]
    get!("search", header, params: %{ q_any: terms }).body[:data]
  end

  defp process_url(url) do
    "https://api.imgur.com/3/gallery/" <> url
  end

  defp process_response_body(body) do
    body
    |> JSX.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
