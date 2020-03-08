defmodule GelleiaApiWeb.Router do
  use GelleiaApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GelleiaApiWeb do
    pipe_through :api
  end
end
