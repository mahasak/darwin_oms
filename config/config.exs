# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :darwin,
  ecto_repos: [Darwin.Repo]

config :darwin_web,
  ecto_repos: [Darwin.Repo],
  generators: [context_app: :darwin]

# Configures the endpoint
config :darwin_web, DarwinWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vg57GtSlKyarmYp00poSKYRwF9CggdTrD7hoVWpl+5RPD++k9G6D9Nvg/BeEsbLe",
  render_errors: [view: DarwinWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Darwin.PubSub,
  live_view: [signing_salt: "JQolVtDE"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
