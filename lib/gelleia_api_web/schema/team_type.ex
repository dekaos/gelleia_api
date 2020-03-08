defmodule GelleiaApiWeb.Schema.Types.TeamType do
  use Absinthe.Schema.Notation
  use Ecto.Schema

  object :team_type do
    field(:id, :id)
    field(:name, :string)
    field(:user_id, :string)
  end
end
