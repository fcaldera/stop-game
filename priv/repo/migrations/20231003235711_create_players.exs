defmodule Stop.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :nickname, :string

      timestamps()
    end
  end
end
