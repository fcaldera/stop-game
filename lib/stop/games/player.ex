defmodule Stop.Games.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :nickname, :string

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:nickname])
    |> validate_required([:nickname])
  end
end
