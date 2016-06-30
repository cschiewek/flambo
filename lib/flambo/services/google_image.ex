defmodule Flambo.Services.GoogleImage do
  use HTTPoison.Base
  @key Application.get_env(:flambo, :google_api_key)
  @id Application.get_env(:flambo, :google_search_id)

  def random(terms) do
    results = search(terms)
    if Enum.empty? results do
      "Sorry, I couldn't find an image for `#{terms}`"
    else
      results
      |> Enum.shuffle
      |> List.first
      |> Map.get("link")
    end
  end

  def search(terms) do
    params = %{ q: terms, key: @key, searchType: "image", cx: @id }
    get!("", [], [params: params, hackney: [ssl_options: [insecure: true]]]).body[:items]
  end

  defp process_url(url) do
    "https://www.googleapis.com/customsearch/v1/" <> url
  end

  defp process_response_body(body) do
    body
    |> JSX.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
