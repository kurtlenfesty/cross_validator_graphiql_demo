defmodule  CrossValidator.AssortmentService.AssortmentWriter do
  require Logger
  alias CrossValidator.AssortmentSchema
  alias CrossValidator.Repo

  def create(args = %{}) do
    Logger.debug("#{__MODULE__}.create", args: args)

    AssortmentSchema.changeset(nil, args)
    |> Repo.insert(returning: true)
  end

  def update(id, args = %{}) do
    Logger.debug("#{__MODULE__}.update", id: id, args: args)

    struct(AssortmentSchema, %{id: id})
    |> AssortmentSchema.changeset(args)
    |> Repo.update(returning: true)
  end
end
