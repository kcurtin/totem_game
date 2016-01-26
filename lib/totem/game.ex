defmodule Totem.Game do
  use GenServer

  def players(game) do
    GenServer.call(game, :players)
  end

  def add_player(game, player) do
    GenServer.cast(game, {:add_player, player})
  end

  def remove_player(game, player) do
    GenServer.cast(game, {:remove_player, player})
  end

  ###
  # GenServer API
  ###

  def init do
    {:ok, []}
  end

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def handle_cast({:add_player, player}, players) do
    {:noreply, [player | players]}
  end

  def handle_cast({:remove_player, player}, players) do
    {:noreply, List.delete(players, player)}
  end

  def handle_call(:players, _from, players) do
    {:reply, players, players}
  end
end
