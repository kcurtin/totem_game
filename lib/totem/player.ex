defmodule Totem.Player do
  defstruct name: nil,
            x: 0,
            y: 0,
            health: 100,
            alive: true


  def new do
    %__MODULE__{}
  end
end
