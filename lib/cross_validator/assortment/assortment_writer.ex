defmodule CrossValidator.AssortmentService.AssortmentWriter do
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

  def delete(id) do
    Logger.debug("#{__MODULE__}.delete", id: id)

    assortment = struct(AssortmentSchema, %{id: id})

    # Delete but be sure to capture any issue with deleting and returning appropriately. We don't do anything different
    # with an error (like if the record has already been deleted)
    case Repo.delete(assortment, stale_error_field: true) do
      {:ok, _struct} ->
        {:ok, id}

      {:error, changeset} ->
        Logger.warn("#{__MODULE__}.delete Error deleting", id: id, changeset: changeset)
        {:error, changeset}
    end
  end
end
