defmodule Stop.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :code, :string
      add :max_rounds, :integer, null: false

      timestamps()
    end

    create unique_index(:games, [:code])
  end
end
