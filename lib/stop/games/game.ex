defmodule Stop.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias Stop.Games.Player

  schema "games" do
    field :code, :string
    field :max_rounds, :integer, default: 3

    many_to_many :players, Player, join_through: "game_players", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:max_rounds])
    |> validate_required([:max_rounds])
  end
end
