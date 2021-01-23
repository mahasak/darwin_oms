# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :darwin,
  ecto_repos: [Darwin.Repo]

# Configures the endpoint
config :darwin, DarwinWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NCC6iwPVzHUSq4YudLQlxJjHMdAXfh9eXQ7yXMh7Bdd2GSzPm9jHrrM4zWt3znrn",
  render_errors: [view: DarwinWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Darwin.PubSub,
  live_view: [signing_salt: "DK2KBfpj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
