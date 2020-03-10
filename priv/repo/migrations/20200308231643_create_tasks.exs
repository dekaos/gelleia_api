defmodule GelleiaApi.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :task, :string
      add :user_id, :binary_id
      add :team_id, :binary_id
      add :finished_at, :utc_datetime
      add :finished, :boolean, default: false, null: false

      timestamps()
    end

  end
end
