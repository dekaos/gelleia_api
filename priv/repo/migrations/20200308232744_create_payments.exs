defmodule GelleiaApi.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :transaction_id, :string
      add :user_id, :binary_id
      add :status, :string
      add :value, :string

      timestamps()
    end

  end
end
