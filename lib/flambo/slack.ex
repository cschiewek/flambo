defmodule Flambo.Slack do
  use Slack

  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    if String.starts_with?(message.text, slack.me.name) || String.match?(message.text, ~r/<@#{slack.me.id}>/) do
      process_message(message.text, message.channel, slack)
    end
    {:ok, state}
  end

  def handle_message(message, _slack, state) do
    IO.puts inspect(message)
    {:ok, state}
  end

  defp process_message(message, channel, slack) do
    send_message("What?", channel, slack)
  end
end
