defmodule GelleiaApi.Schema do
  use Absinthe.Schema

  import_types(GelleiaApiWeb.Schema.Types)
  alias GelleiaApiWeb.Resolvers

  query do
    @desc "Get a list of all users"
    field :users, list_of(:user_type) do
      resolve(&Resolvers.UserResolver.users/3)
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

    @desc "Get a list of :uuid of user teams"
    field :user_teams, list_of(:user_team) do
      resolve fn _parent, _args, _resolution ->
        {:ok, GelleiaApi.UserTeams.list_user_teams()}
      end
    end
  end

  mutation do
    @desc "Register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "Login a user and return the token"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&GelleiApiWeb.Resolvers.SessionResolver.login_user/3)
    end
  end
#
#  subscription do
#
#  end
end
