defmodule Totem.Player do
  defstruct name: nil,
            x: 0,
            y: 0,
            id: nil,
            score: 0,
            health: 100,
            alive: true


  def new, do: %__MODULE__{id: :random.uniform(100)}
  def new(score), do: %__MODULE__{score: score, id: :random.uniform(100)}
end
