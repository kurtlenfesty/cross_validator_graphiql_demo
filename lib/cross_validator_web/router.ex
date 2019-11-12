defmodule CrossValidatorWeb.Router do
  use CrossValidatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: CrossValidatorWeb.Schema

    forward "/", Absinthe.Plug, schema: CrossValidatorWeb.Schema
  end
end
