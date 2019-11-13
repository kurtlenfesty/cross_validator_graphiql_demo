defmodule CrossValidator.AssortmentService.AssortmentReader do
  require Logger
  alias CrossValidator.AssortmentSchema
  alias CrossValidator.Repo

  import Ecto.Query

  @permitted_query_parameters [
    :uid,
    :special_number_one,
    :special_number_two,
    :magical_string_one,
    :magical_string_two,
    :mythical_boolean_one,
    :mythical_boolean_two,
    :fairy_date_one,
    :fairy_date_two
  ]

  def fetch_one(_args = %{uid: uid}) do
    Repo.one(from(p in AssortmentSchema, where: p.uid == ^uid))
  end

  def fetch_one(_args = %{id: id}) do
    Repo.one(from(p in AssortmentSchema, where: p.id == ^id))
  end

  def fetch_many(filter = %{}) do
    filter
    |> CrossValidator.Utils.parameters_as_atom_map(@permitted_query_parameters)
    |> query_by_params(CrossValidator.AssortmentSchema)
    |> Repo.all()
  end

  # Create an Ecto where query using the args map as keys/values
  defp query_by_params(args = %{}, schema) do
    Enum.reduce(args, schema, fn {key, val}, queryable ->
      where(queryable, ^dynamic([m], field(m, ^key) == ^val))
    end)
  end
end
