defmodule StatusboardWeb.PageController do
  use StatusboardWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
