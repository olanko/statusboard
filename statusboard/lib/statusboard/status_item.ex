defmodule Statusboard.StatusItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Statusboard.StatusItem


  schema "items" do
    field :item_id, :integer
    field :name, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(%StatusItem{} = status_item, attrs) do
    status_item
    |> cast(attrs, [:item_id, :name, :status])
    |> validate_required([:item_id, :name, :status])
  end
end
