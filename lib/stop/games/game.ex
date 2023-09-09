defmodule Stop.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :code, :string
    field :max_rounds, :integer, default: 3

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:max_rounds])
    |> validate_required([:max_rounds])
    |> unique_constraint(:code)
  end
end
