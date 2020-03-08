defmodule GelleiaApi.Repo do
  use Ecto.Repo,
    otp_app: :gelleia_api,
    adapter: Ecto.Adapters.Postgres
end
