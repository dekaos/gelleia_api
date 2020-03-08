defmodule GelleiaApi.Repo.Migrations.ChangeUsersIdFieldType do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :id, :binary_id
    end
  end
end
