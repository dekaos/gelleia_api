defmodule GelleiaApi.Repo.Migrations.AddStartedAtFieldInTasksTable do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :started_at, :utc_datetime
    end
  end
end
