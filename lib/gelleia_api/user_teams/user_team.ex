defmodule GelleiaApi.UserTeams.UserTeam do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_teams" do
    field :team_id, Ecto.UUID
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(user_team, attrs) do
    user_team
    |> cast(attrs, [:team_id, :user_id])
    |> validate_required([:team_id, :user_id])
  end
end
