defmodule CrossValidator.Repo.Migrations.CreateAssortment do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")

    create table(:assortments_v1) do
      add :uid, :uuid, default: fragment("uuid_generate_v4()"), null: false
      add :special_number_one, :integer, default: -1, null: false
      add :special_number_two, :integer, default: 501, null: false
      add :magical_string_one, :string
      add :magical_string_two, :string
      add :mythical_boolean_one, :boolean, default: true
      add :mythical_boolean_two, :boolean, default: false
      add :list_of_strings_one, {:array, :string}, default: []
      add :list_of_strings_two, {:array, :string}, default: []
      add :fairy_date_one, :date
      add :fairy_date_two, :date
      add :grab_bag_map_one, :map
      add :grab_bag_map_two, :map

      timestamps(type: :utc_datetime_usec)
    end

    create unique_index(:assortments_v1, :uid)
  end
end
