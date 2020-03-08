defmodule GelleiaApi.Schema do
  use Absinthe.Schema

  import_types(GelleiaApiWeb.Schema.Types)

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve fn _parent, _args, _resolution ->
        {:ok, GelleiaApi.Accounts.list_users()}
      end
    end

    @desc "Get a list of all teams"
    field :teams, list_of(:team_type) do
      resolve fn _parent, _args, _resolution ->
        {:ok, GelleiaApi.Teams.list_teams()}
      end
    end

    @desc "Get a list of all tasks"
    field :tasks, list_of(:task_type) do
      resolve fn _parent, _args, _resolution ->
        {:ok, GelleiaApi.Tasks.list_tasks()}
      end
    end

    @desc "Get a list of user payments"
    field :payments, list_of(:payment_type) do
      resolve fn _parent, _args, _resolution ->
        {:ok, GelleiaApi.Payments.list_payments()}
      end
    end
  end

#  mutations do
#
#  end
#
#  subscription do
#
#  end
end
