defmodule GelleiaApi.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :task, :string
      add :user_id, :uuid
      add :team_id, :uuid
      add :finished_at, :utc_datetime
      add :finished, :boolean, default: false, null: false

      timestamps()
    end

  end
end
