# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gelleia_api,
  ecto_repos: [GelleiaApi.Repo]

# Configures the endpoint
config :gelleia_api, GelleiaApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GZwPPGljk+iJNsNnSAzk74dRxQ3lb0MohgHYZ+P+Y9edKgxPKVms5u+X9cXE5GP9",
  render_errors: [view: GelleiaApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GelleiaApi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Bb3xMCNx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :gelleia_api, GelleiaApi.Accounts.Guardian,
       issuer: "gelleia_api",
       secret_key: ""

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
