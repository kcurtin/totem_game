defmodule Totem.Repo.Migrations.Messages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :player_id, :integer

      timestamps
    end
  end
end
