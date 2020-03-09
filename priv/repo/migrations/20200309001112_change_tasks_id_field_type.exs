defmodule GelleiaApi.Repo.Migrations.ChangeTasksIdFieldType do
  use Ecto.Migration

  def change do
    alter table(:tasks, primary_key: false) do
      remove :id
      add :id, :binary_id, primary_key: true
    end
  end
end
