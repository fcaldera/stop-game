defmodule Stop.Repo.Migrations.CreateGamePlayers do
  use Ecto.Migration

  def change do
    create table(:game_players, primary_key: false) do
      add :game_id, references(:games, on_delete: :delete_all)
      add :player_id, references(:players, on_delete: :delete_all)
    end

    create index(:game_players, [:game_id])
    create unique_index(:game_players, [:player_id, :game_id])
  end
end
