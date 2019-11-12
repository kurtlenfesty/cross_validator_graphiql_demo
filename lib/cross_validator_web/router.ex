defmodule CrossValidatorWeb.Router do
  use CrossValidatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CrossValidatorWeb do
    pipe_through :api
  end
end
