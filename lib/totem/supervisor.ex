defmodule Totem.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Totem.Repo, []),
      worker(Totem.Game, [Totem.Game])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
