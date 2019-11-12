defmodule CrossValidatorWeb.Schema do
  use Absinthe.Schema
  # aggregate domain specific logic into a shared graphql endpoint

  import_types(Absinthe.Type.Custom)
  import_types(CrossValidatorWeb.Schema.Types.UUID4)
  import_types(CrossValidatorWeb.Schema.Types.JSON)
  import_types(CrossValidatorWeb.Schema.Types.Assortment)

  query do
    import_fields(:assortment_queries)
  end

  mutation do
    import_fields(:assortment_mutations)
  end
end
