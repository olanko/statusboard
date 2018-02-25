defmodule Statusboard.Status do
    use Agent
    @name __MODULE__

    def start_link do
        Agent.start_link(&initialize_status/0, name: @name)
    end

    def initialize_status() do
        Statusboard.Repo.all(Statusboard.StatusItem)
            |> Enum.reduce(
                %{},
                fn item, items_map ->
                    Map.update(items_map, item.item_id, item, fn _x -> item end)
                end
            )
    end

    def get_all do
        Agent.get(@name, fn state -> state end)
    end

    def get(key) do
        Agent.get(@name, fn state -> Map.get(state, key) end)
    end

    def update(key, value) do
        Agent.update(@name, fn state -> Map.update(state, key, value, fn _x -> value end) end)
    end
end