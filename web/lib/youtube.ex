defmodule YouTube do
  use HTTPoison.Base
  @key Application.get_env(:flambo, Flambo.Endpoint)[:google_api_key]

  def search(terms, limit \\ 1) do
    params = %{ key: @key, part: "snippet", type: "video", q: terms, maxResults: limit }
    results = get!("search", [], params: params).body[:items]
    if Enum.empty? results do
      "Sorry, I couldn't find a video for `#{terms}`"
    else
      video_id = results
      |> List.first
      |> Map.get("id")
      |> Map.get("videoId")
      "https://youtu.be/#{video_id}"
    end
  end

  defp process_url(url) do
    "https://www.googleapis.com/youtube/v3/" <> url
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
