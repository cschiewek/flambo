defmodule Flambo.Slack do
  use Slack

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    case Map.fetch(message, :text) do
      {:ok, text} -> String.match?(message.text, ~r/<@#{slack.me.id}>/) && process_message(message, slack)
      _ -> nil
    end
    {:ok, state}
  end

  def handle_message(_message, _slack, state) do
    {:ok, state}
  end

  defp process_message(message, slack) do
    payload = message.text |> String.replace(~r/<@#{slack.me.id}>/, "") |> String.trim
    {function, arguments} = Flambo.Commands.find(payload)
    response = function.(arguments, "<@#{message.user}>", slack.me.name)
    send_message(response, message.channel, slack)
  end
end
