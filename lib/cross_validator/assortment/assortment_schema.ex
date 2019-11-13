defmodule CrossValidator.AssortmentSchema do
  @moduledoc """
    Assortment schema.
  """

  use Ecto.Schema
  import Ecto.Changeset

  require Logger

  schema "assortments_v1" do
    field(:uid, :binary_id)
    field(:special_number_one, :integer, default: -1)
    field(:special_number_two, :integer, default: 501)
    field(:magical_string_one, :string)
    field(:magical_string_two, :string)
    field(:mythical_boolean_one, :boolean, default: true)
    field(:mythical_boolean_two, :boolean, default: false)
    field(:list_of_strings_one, {:array, :string}, default: [])
    field(:list_of_strings_two, {:array, :string}, default: [])
    field(:fairy_date_one, :date)
    field(:fairy_date_two, :date)
    field(:grab_bag_map_one, :map)
    field(:grab_bag_map_two, :map)

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(assortment = %CrossValidator.AssortmentSchema{}, attrs = %{}),
    do: cast_changeset(assortment, attrs)

  def changeset(_assortment, attrs = %{}),
    do: cast_changeset(%CrossValidator.AssortmentSchema{}, attrs)

  defp cast_changeset(assortment = %CrossValidator.AssortmentSchema{}, attrs = %{}) do
    assortment
    |> cast(attrs, __schema__(:fields))
    |> validate_required([:magical_string_one, :magical_string_two])
  end
end
