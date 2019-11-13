defmodule CrossValidatorWeb.AssortmentResolver do
  @moduledoc """
    Resolves Assortment-related GraphiQL queries.
  """

  require Logger

  alias CrossValidator.AssortmentService

  def assortment(_, filter = %{}, _) do
    Logger.debug("#{__MODULE__}.assortment", filter: filter)
    AssortmentService.fetch_one(filter)
  end

  def create(_, %{input: input}, _) do
    Logger.debug("#{__MODULE__}.create", input: input)
    AssortmentService.create(input)
  end

  def update(_, %{id: id, input: input}, _) do
    Logger.debug("#{__MODULE__}.update", input: input)
    AssortmentService.update(id, input)
  end

  def delete(_, %{id: id}, _) do
    Logger.debug("#{__MODULE__}.delete", id: id)
    AssortmentService.delete(id)
  end

  def assortments(_, filter = %{}, _) do
    Logger.debug("#{__MODULE__}.assortments", filter: filter)
    {:ok, results} = AssortmentService.fetch_many(filter)

    {:ok, %{nodes: results}}
  end
end
