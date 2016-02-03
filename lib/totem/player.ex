defmodule Totem.Player do
  use Ecto.Schema

  alias Totem.Repo

  schema "players" do
    field :name
    field :x, :integer, default: 0
    field :y, :integer, default: 0
    field :health, :integer, default: 100
    field :score, :integer, default: 0
    field :alive, :boolean, default: true

    timestamps
  end

  def new, do: Repo.insert! %__MODULE__{}
  def new(score), do: Repo.insert! %__MODULE__{score: score}
end
