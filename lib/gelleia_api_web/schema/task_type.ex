defmodule GelleiaApiWeb.Schema.Types.TaskType do
  use Absinthe.Schema.Notation

  object :task_type do
    field(:id, :id)
    field(:task, :string)
    field(:user_id, :uuid4)
    field(:team_id, :uuid4)
    field(:started_at, :datetime)
    field(:finished_at, :datetime)
    field(:finished, :boolean)
    field(:inserted_at, :datetime)
    field(:updated_at, :datetime)
  end
end
