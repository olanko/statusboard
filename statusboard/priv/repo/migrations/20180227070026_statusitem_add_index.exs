defmodule Statusboard.Repo.Migrations.StatusitemAddIndex do
  use Ecto.Migration

  def change do
    create index("items", [:item_id], unique: true)
  end
end
