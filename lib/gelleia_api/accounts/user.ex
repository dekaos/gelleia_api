defmodule GelleiaApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :email, :string, unique: true
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :picture, :string
    field :role, :string, default: "user"
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :picture, :email, :password, :password_confirmation, :role, :status])
    |> validate_required([
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
    ])
    |> validate_format(:email, ~r/@/, message: "INVALID_EMAIL_FORMAT")
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 6, max: 32, message: "INVALID_PASSWORD_LENGTH")
    |> validate_confirmation(:password, message: "PASSWORD_DONT_MATCH")
    |> unique_constraint(:email, message: "EMAIL_IS_ALREADY_BEEN_TAKEN")
    |> hash_password
  end

  defp hash_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hash_password(changeset) do
    changeset
  end
end
