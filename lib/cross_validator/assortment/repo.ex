defmodule CrossValidator.Repo do
  use Ecto.Repo,
    otp_app: :cross_validator,
    adapter: Ecto.Adapters.Postgres
end
