defmodule GelleiaApiWeb.Router do
  use GelleiaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
    forward("/graphql", Absinthe.Plug, schema: GelleiaApi.Schema)

    if Mix.env() == :dev do
      forward("/graphiql", Absinthe.Plug.GraphiQL, schema: GelleiaApi.Schema)
    end
  end
end
