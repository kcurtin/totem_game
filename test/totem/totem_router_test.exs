defmodule Totem.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  require IEx

  alias Totem.Router

  @opts Router.init([])

  test "creates a new game" do
    conn = conn(:post, "/games")
    conn = Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
  end

  # test "adds a new player" do
  #   conn = conn(:post, "/players")
  #   conn = Router.call(conn, @opts)
  #
  #   assert conn.state == :sent
  #   assert conn.status == 200
  # end
  #
  # test "removes a player" do
  #   conn = conn(:delete, "/players")
  #   conn = Router.call(conn, @opts)
  #
  #   assert conn.state == :sent
  #   assert conn.status == 200
  # end
  #
  # test "returns a leaderboard" do
  #   conn = conn(:get, "/leaderboard")
  #   conn = Router.call(conn, @opts)
  #
  #   assert conn.state == :sent
  #   assert conn.status == 200
  # end
end
