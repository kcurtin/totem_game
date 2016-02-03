defmodule Totem.Repo.Migrations.Players do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :x, :integer, default: 0
      add :y, :integer, default: 0
      add :health, :integer, default: 100
      add :score, :integer, default: 0
      add :alive, :boolean, default: true

      timestamps
    end
  end
end
