defmodule GelleiaApiWeb.Schema.Types.TeamType do
  use Absinthe.Schema.Notation

  object :team_type do
    field(:id, :id)
    field(:name, :string)
    field(:user_id, :uuid4)
  end
end
