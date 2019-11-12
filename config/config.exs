# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cross_validator, CrossValidator.Repo,
  # NOTE: This is the production database, which will be overridden by the dev and test configuration.
  database: "cross_validator_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  # TODO change to 5432 before checking in
  port: 5432

config :cross_validator,
  ecto_repos: [CrossValidator.Repo]

# Configures the endpoint
config :cross_validator, CrossValidatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gw7Z5mdVRkXSpdAPpXlPPHfG8Cz5DDFkqsIgmlDivCMjcqBV5dpJ4Nq1HnGfFrvZ",
  render_errors: [view: CrossValidatorWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CrossValidator.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
