defmodule Totem.LeaderboardTest do
  use ExUnit.Case

  alias Totem.Player

  setup do
    {:ok, board} = Leaderboard.start([])
    {:ok, board: board}
  end

  test "ranks all things", %{board: board} do
    Leaderboard.add(board, Player.new(30))
    Leaderboard.add(board, Player.new(10))
    Leaderboard.add(board, Player.new(20))

    assert [30, 20, 10] == Enum.map(Leaderboard.all(board), &(&1.score))
  end

  test "returns the highest ranked", %{board: board} do
    Leaderboard.add(board, Player.new(10))
    Leaderboard.add(board, Player.new(30))
    assert Leaderboard.leader(board).score == 30
  end

  test "returns the lowest ranked", %{board: board} do
    Leaderboard.add(board, Player.new(30))
    Leaderboard.add(board, Player.new(10))
    assert Leaderboard.loser(board).score == 10
  end

  test "adds and ranks a new thing", %{board: board} do
    first = Player.new(30)
    Leaderboard.add(board, first)
    assert Leaderboard.leader(board) == first
    second = Player.new(31)
    Leaderboard.add(board, second)
    assert Leaderboard.leader(board) == second
  end

  test "re-ranks and updates existing things", %{board: board} do
    low = Player.new(10)
    high = Player.new(30)
    Leaderboard.add(board, low)
    Leaderboard.add(board, high)

    assert Leaderboard.loser(board) == low
    assert length(Leaderboard.all(board)) == 2

    low = %{low | score: high.score + 1}
    Leaderboard.add(board, low)

    assert Leaderboard.leader(board) == low
    assert length(Leaderboard.all(board)) == 2
  end
end
