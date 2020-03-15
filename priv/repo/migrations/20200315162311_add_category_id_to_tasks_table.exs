defmodule GelleiaApi.Repo.Migrations.AddCategoryIdToTasksTable do
  use Ecto.Migration

  def change do
    alter table(:tasks) do
      add :category_id, :binary_id
    end
  end
end
