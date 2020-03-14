defmodule GelleiaApi.Repo.Migrations.AddMoreFieldsInPaymentsTable do
  use Ecto.Migration

  def change do
    alter table(:payments) do
      add :payment_hub, :string
      add :receipt, :text
    end
  end
end
