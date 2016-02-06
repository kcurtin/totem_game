defmodule Totem.Message do
  use Ecto.Schema

  alias Totem.Repo

  schema "messages" do
    field :content
    field :player_id, :integer

    timestamps
  end

  def new(content, player), do: Repo.insert! %__MODULE__{content: content, player_id: player.id}
end
