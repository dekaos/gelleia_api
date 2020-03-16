defmodule GelleiaApiWeb.Resolvers.UserResolver do
  alias GelleiaApi.Accounts

  def users(_, _, _) do
    {:ok, Accounts.list_users()}
  end
end