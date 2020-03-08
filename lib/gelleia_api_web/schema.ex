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
  end

#  mutations do
#
#  end
#
#  subscription do
#
#  end
end
