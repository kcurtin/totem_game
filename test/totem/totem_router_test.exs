defmodule Totem.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  require IEx

  alias Totem.Router
  alias Totem.Player
  alias Totem.Message
  alias Ecto.Adapters.SQL

  @opts Router.init([])

  setup do
    SQL.begin_test_transaction(Totem.Repo)

    on_exit fn ->
      SQL.rollback_test_transaction(Totem.Repo)
    end
  end

  test "creates a new game" do
    conn = conn(:post, "/games")
    conn = Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  test "returns messages" do
    player = Player.new
    message_1 = Message.new("Test", player)
    message_2 = Message.new("Test", player)
    conn = conn(:get, "/messages")
    conn = Router.call(conn, @opts)

    assert Poison.decode!(conn.resp_body) == [message_1, message_2]
                                              |> Poison.encode!
                                              |> Poison.decode!
  end

  test "creates a new message" do
    player = Player.new
    msg = [content: "testing", player_id: player.id]
    conn = conn(:post, "/messages", msg)
    conn = Router.call(conn, @opts)

    message = Poison.decode!(conn.resp_body)
    assert message["content"] == "testing"
    assert message["player_id"] == player.id
  end
end
