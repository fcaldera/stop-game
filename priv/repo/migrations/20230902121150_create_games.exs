defmodule Stop.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :max_rounds, :integer, null: false

      timestamps()
    end
  end
end
