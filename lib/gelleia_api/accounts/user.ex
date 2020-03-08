defmodule GelleiaApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string, unique: true
    field :first_name, :string
    field :last_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirm, :string, virtual: true
    field :picture, :string
    field :role, :string, default: "user"
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
        :first_name,
        :last_name, 
        :picture,
        :email, 
        :password, 
        :password_confirmation, 
        :role,
        :status
      ])
    |> validate_required([
      :first_name,
      :last_name,
      :picture,
      :email,
      :password,
      :password_confirmation,
      :role,
      :status
    ])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase($1))
    |> validate_lenght(:password, min: 6, max: 32)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password
  end
  
  defp hash_password(changeset) do 
    changeset
  end  
end
