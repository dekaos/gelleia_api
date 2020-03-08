defmodule GelleiaApi.Payments.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "payments" do
    field :status, :string
    field :transaction_id, :string
    field :user_id, :string
    field :value, :string

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:transaction_id, :user_id, :status, :value])
    |> validate_required([:transaction_id, :user_id, :status, :value])
  end
end
