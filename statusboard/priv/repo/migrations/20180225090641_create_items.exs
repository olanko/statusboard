defmodule Statusboard.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :item_id, :integer
      add :name, :string
      add :status, :string

      timestamps()
    end

  end
end
