defmodule Statusboard.Status do
    alias Statusboard.StatusItem
    alias Statusboard.Repo

    use Agent
    @name __MODULE__

    def start_link do
        Agent.start_link(&initialize_status/0, name: @name)
    end

    @doc """
    Fetches the status from the database.
    """
    def initialize_status() do
        Repo.all(StatusItem)
            |> Enum.reduce(
                %{},
                fn item, items_map ->
                    Map.update(items_map, item.item_id, item, fn _x -> item end)
                end
            )
    end

    @doc """
    Get all the item statuses.
    """
    def get_all do
        Agent.get(@name, fn state -> state end)
    end

    @doc """
    Get item status by key.
    """
    def get(key) do
        Agent.get(@name, fn state -> Map.get(state, key) end)
    end

    @doc """
    Update item status. Saves the info to the database.
    """
    def update(key, statusvalue) do
        statusitem = Repo.get_by(StatusItem, item_id: key)

        statusitem = case statusitem do
            nil -> %StatusItem{item_id: key, name: to_string(key), status: statusvalue}
            _ -> statusitem
        end

        changeset = statusitem
            |> Ecto.Changeset.change(status: statusvalue)

        statusitem = case changeset.valid? do
            true -> changeset |> Repo.insert_or_update
            false -> statusitem
        end

        Agent.update(@name, fn state -> Map.update(state, key, statusitem, fn _x -> statusitem end) end)
    end
end