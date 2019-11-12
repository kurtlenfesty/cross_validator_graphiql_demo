defmodule CrossValidator.AssortmentService do
  alias CrossValidator.AssortmentService.AssortmentReader
  alias CrossValidator.AssortmentService.AssortmentWriter

  require Logger

  @moduledoc """
  Entrypoint to interact with Assortment data stored in Postgres.
  """

  @doc """
    Returns a single Assortment based on the id.

    ## Example

      iex> fetch_one(args = %{ id: 123 })
      {:ok, %ExperimentGraphqlValidation.AssortmentService.AssortmentSchema{}}
  """
  def fetch_one(args = %{id: id}) do
    Logger.debug("#{__MODULE__}.fetch_one", id: id, args: args)
    {:ok, AssortmentReader.fetch_one(args)}
  end

  @doc """
    Returns a single Assortment based on the external_id.

    ## Example

      iex> fetch_one(args = %{ uid: "abcd-123" })
      {:ok, %ExperimentGraphqlValidation.AssortmentService.AssortmentSchema{}}
  """
  def fetch_one(args = %{uid: uid}) do
    Logger.debug("#{__MODULE__}.fetch_one", uid: uid, args: args)
    {:ok, AssortmentReader.fetch_one(args)}
  end

  def fetch_one(args) do
    Logger.warn("#{__MODULE__}.fetch_one: Cannot fetch with provided arguments", args: args)
    {:error}
  end

  @doc """
   Returns many Assortment based on provided criteria. Note that we don't use `args` parameter yet
   but to keep the interface consistent with other apps, any user of this will still need pass
   through an empty map

    ## Example

      iex> fetch_many(args = %{})
      {:ok, [%ExperimentGraphqlValidation.AssortmentService.AssortmentSchema{}]}

  """
  def fetch_many(args = %{}) do
    Logger.debug("#{__MODULE__}.fetch_many", args: args)
    {:ok, AssortmentReader.fetch_many(args)}
  end

  def fetch_many(args) do
    Logger.warn("#{__MODULE__}.fetch_many: Cannot fetch with provided arguments", args: args)
    {:error}
  end

  @doc """
    Creates a new Assortment for the given args.

    ## Example

      iex> create(%{magical_string_one: "My cool assortment"})
      {:ok, %ExperimentGraphqlValidation.AssortmentService.AssortmentSchema{}}
  """
  def create(args = %{}) do
    Logger.debug("#{__MODULE__}.create", args: args)

    AssortmentWriter.create(args)
  end

  def create(args) do
    Logger.warn("#{__MODULE__}.create: Cannot create with provided arguments", args: args)
    {:error}
  end

  @doc """
    Updates an existing Assortment for the given args. The Assortment is retrieved via it's `ID`

  ## Examples

      iex> update(123, %{magical_string_one: "My cool assortment"})
      {:ok, %Solve.ProductService.ProductSchema{}}

  """
  def update(id, args = %{}) do
    Logger.debug("#{__MODULE__}.update", id: id, args: args)
    AssortmentWriter.update(id, args)
  end

  def update(id, args) do
    Logger.warn("#{__MODULE__}.update: Cannot update with provided arguments", id: id, args: args)
    {:error}
  end
end
