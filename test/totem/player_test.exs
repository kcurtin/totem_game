defmodule Totem.PlayerTest do
  use ExUnit.Case
  alias Totem.Player

  test "has an x and y" do
    player = Player.new
    assert player.x == 0
    assert player.y == 0
  end

  test "has default health of 100" do
    player = Player.new
    assert player.health == 100
  end

  test "is alive" do
    player = Player.new
    assert player.alive == true
  end
end
