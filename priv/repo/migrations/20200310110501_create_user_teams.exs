defmodule GelleiaApi.Repo.Migrations.CreateUserTeams do
  use Ecto.Migration

  def change do
    create table(:user_teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :team_id, :binary_id
      add :user_id, :binary_id

      timestamps()
    end

  end
end
