# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :darwin_oms,
  ecto_repos: [DarwinOms.Repo]

# Configures the endpoint
config :darwin_oms, DarwinOmsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wy+ebeZ4tFr2iNxyl//UTUK5Kbpjy5x7lh93uuNJfMCooRMNbXOoiphsQv+7teVk",
  render_errors: [view: DarwinOmsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: DarwinOms.PubSub,
  live_view: [signing_salt: "oDiI2Aul"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
