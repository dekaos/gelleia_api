defmodule GelleiaApiWeb.Schema.Types.UserTeamType do
  use Absinthe.Schema.Notation

  object :user_team do
    field(:id, :id)
    field(:team_id, :uuid4)
    field(:user_id, :uuid4)
  end
end
