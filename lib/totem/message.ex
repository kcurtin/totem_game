defmodule Totem.Message do
  use Ecto.Schema

  alias Totem.Repo

  @derive {Poison.Encoder, only: [:content, :player_id]}
  schema "messages" do
    field :content
    belongs_to :player, Totem.Player

    timestamps
  end

  def new(content, player), do: Repo.insert! %__MODULE__{content: content, player_id: player.id}
end
