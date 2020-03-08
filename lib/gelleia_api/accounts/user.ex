defmodule GelleiaApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :picture, :string
    field :role, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :picture, :email, :password_hash, :role, :status])
    |> validate_required([
      :first_name,
      :last_name,
      :picture,
      :email,
      :password_hash,
      :role,
      :status
    ])
  end
end
