defmodule GelleiaApi.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "teams" do
    field :name, :string
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :user_id])
    |> validate_required([:name, :user_id])
  end
end
