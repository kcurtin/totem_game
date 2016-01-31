defmodule Leaderboard do
  use GenServer

  def all(board),    do: GenServer.call(board, :all)
  def leader(board), do: GenServer.call(board, :leader)
  def loser(board),  do: GenServer.call(board, :loser)

  def add(board, scoreable) do
    GenServer.cast(board, {:add, scoreable})
  end

  def start(list) do
    GenServer.start_link(__MODULE__, list)
  end

  ###
  # GenServer API
  ###

  def init(scoreables) do
    {:ok, rank(scoreables)}
  end

  def handle_call(:all, _from, scoreables) do
    {:reply, scoreables, scoreables}
  end

  def handle_call(:leader, _from, scoreables) do
    {:reply, List.first(scoreables), scoreables}
  end

  def handle_call(:loser, _from, scoreables) do
    {:reply, List.last(scoreables), scoreables}
  end

  def handle_cast({:add, scoreable}, scoreables) do
    index = Enum.find_index(scoreables, &(&1.id == scoreable.id))

    if index do
      scoreables = List.replace_at(scoreables, index, scoreable)
      {:noreply, rank(scoreables)}
    else
      {:noreply, rank([scoreable | scoreables])}
    end
  end

  defp rank(scoreables), do: Enum.sort(scoreables, &(&1.score > &2.score))
end
