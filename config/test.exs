use Mix.Config

# Configure your database
config :cross_validator, CrossValidator.Repo,
  username: "postgres",
  password: "postgres",
  database: "cross_validator_test",
  hostname: "localhost",
  # TODO change to 5432 before checking in
  port: 5432,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cross_validator, CrossValidatorWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
