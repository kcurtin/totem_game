defmodule Totem.MessageTest do
  use ExUnit.Case
  use DBTransactions
  alias Totem.Message
  alias Totem.Player

  test "has content" do
    player = Player.new
    message = Message.new("My message", player)
    assert message.content == "My message"
    assert message.player_id == player.id
  end
end
