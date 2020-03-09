defmodule GelleiaApi.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "tasks" do
    field :finished, :boolean, default: false
    field :finished_at, :utc_datetime
    field :task, :string
    field :team_id, Ecto.UUID
    field :user_id, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:task, :user_id, :team_id, :finished_at, :finished])
    |> validate_required([:task, :user_id, :team_id, :finished_at, :finished])
  end
end
