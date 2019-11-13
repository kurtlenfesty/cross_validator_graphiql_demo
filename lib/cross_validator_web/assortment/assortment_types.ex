defmodule CrossValidatorWeb.Schema.Types.Assortment do
  @moduledoc """
    GraphQL schema for Assortment.
  """

  use Absinthe.Schema.Notation

  alias CrossValidatorWeb.AssortmentResolver

  @desc "Assortment queryable fields (without the id)"
  object :assortment_queryable_fields do
    field(:uid, :uuid4)
    field(:special_number_one, :integer)
    field(:special_number_two, :integer)
    field(:magical_string_one, :string)
    field(:magical_string_two, :string)
    field(:mythical_boolean_one, :boolean)
    field(:mythical_boolean_two, :boolean)
  end

  @desc "Assortment non-queryable fields"
  object :assortment_non_queryable_fields do
    field(:list_of_strings_one, list_of(:string))
    field(:list_of_strings_two, list_of(:string))
    field(:fairy_date_one, :date)
    field(:fairy_date_two, :date)
    field(:grab_bag_map_one, :json)
    field(:grab_bag_map_two, :json)
  end

  @desc "Assortment"
  object :assortment do
    field(:id, :integer)
    import_fields(:assortment_queryable_fields)
    import_fields(:assortment_non_queryable_fields)
  end

  object :assortment_connection do
    field(:nodes, non_null(list_of(non_null(:assortment))))
  end

  object :assortment_deleted do
    field(:id, non_null(:integer))
  end

  # input types
  @desc "Parameters to create a new record for an assortment"
  input_object :assortment_input do
    import_fields(:assortment_queryable_fields)
    import_fields(:assortment_non_queryable_fields)
  end

  object :assortment_queries do
    @desc "Get all assortment records"
    field :assortments, non_null(:assortment_connection) do
      arg(:uid, :uuid4)
      arg(:special_number_one, :integer)
      arg(:special_number_two, :integer)
      arg(:magical_string_one, :string)
      arg(:magical_string_two, :string)
      arg(:mythical_boolean_one, :boolean)
      arg(:mythical_boolean_two, :boolean)

      resolve(&AssortmentResolver.assortments/3)
    end

    @desc "Get a single assortment record via their id"
    field :assortment, :assortment do
      arg(:id, :integer)
      arg(:uid, :uuid4)

      resolve(&AssortmentResolver.assortment/3)
    end
  end

  object :assortment_mutations do
    @desc "Create a new assortment"
    field :create_assortment, :assortment do
      arg(:input, non_null(:assortment_input))
      resolve(&AssortmentResolver.create/3)
    end

    @desc "Update an assortment"
    field :update_assortment, :assortment do
      arg(:id, non_null(:integer))
      arg(:input, non_null(:assortment_input))
      resolve(&AssortmentResolver.update/3)
    end

    @desc "Delete an assortment"
    field :delete_assortment, :assortment_deleted do
      arg(:id, non_null(:integer))
      resolve(&AssortmentResolver.delete/3)
    end
  end
end
