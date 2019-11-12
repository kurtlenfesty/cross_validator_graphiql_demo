defmodule CrossValidator.AssortmentService.AssortmentReader do
  require Logger
  alias CrossValidator.AssortmentSchema
  alias CrossValidator.Repo

  import Ecto.Query, only: [from: 2]

  def fetch_one(_args = %{external_id: external_id}) do
    Repo.one(from(p in AssortmentSchema, where: p.external_id == ^external_id))
  end

  def fetch_one(_args = %{id: id}) do
    Repo.one(from(p in AssortmentSchema, where: p.id == ^id))
  end

  def fetch_many(_args = %{}) do
    Repo.all(AssortmentSchema)
  end
end
