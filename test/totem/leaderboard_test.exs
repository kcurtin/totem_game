defmodule Totem.Leaderboard do
  use ExUnit.Case

  setup do
    low_score = %{score: 10}
    mid_score = %{score: 15}
    high_score = %{score: 20}
    scores = [mid_score, high_score, low_score]
    {:ok, board} = Leaderboard.start([high_score, low_score, mid_score])
    { :ok, [ board: board, low_score: low_score, high_score: high_score, mid_score: mid_score ] }
  end

  test "ranks all things", %{board: board, low_score: low_score, high_score: high_score} do
    scores = Leaderboard.all(board)
    assert List.first(scores) == high_score
    assert List.last(scores) == low_score
  end

  test "returns the highest ranked", %{board: board, high_score: high_score} do
    assert Leaderboard.leader(board) == high_score
  end

  test "returns the lowest ranked", %{board: board, low_score: low_score} do
    assert Leaderboard.loser(board) == low_score
  end

  test "adds a to the leaderboard", %{board: board, high_score: high_score} do
    new_high_score = %{score: high_score.score + 1}
    Leaderboard.add(board, new_high_score)
    assert Leaderboard.leader(board) == new_high_score
  end
end
