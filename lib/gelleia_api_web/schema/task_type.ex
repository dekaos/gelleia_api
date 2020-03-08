defmodule GelleiaApiWeb.Schema.Types.TaskType do
  use Absinthe.Schema.Notation

  object :task_type do
    field(:id, :id)
    field(:task, :string)
    field(:user_id, :id)
    field(:team_id, :id)
    field(:finished, :boolean)
  end
end
