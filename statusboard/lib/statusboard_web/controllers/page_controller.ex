defmodule StatusboardWeb.PageController do
  use StatusboardWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def status(conn, params) do

    json conn, Statusboard.Status.get_all
      |> Enum.map(
        fn i ->
          {index, item} = i 
          %{"id" => index, "status" => item.status, "updated_at" => item.updated_at}
        end
      )
  end
end
