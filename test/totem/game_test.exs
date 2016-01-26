defmodule Totem.GameTest do
  use ExUnit.Case

  alias Totem.Game
  alias Totem.Player

  setup do
    {:ok, game} = Game.start_link
    {:ok, game: game}
  end

  test "can add players", %{game: game} do
    player = Player.new
    Game.add_player(game, player)
    assert Game.players(game) == [player]
  end

  test "can remove players", %{game: game} do
    player = Player.new
    Game.add_player(game, player)
    assert Game.players(game) == [player]
    Game.remove_player(game, player)
    assert Game.players(game) == []
  end
end
