defmodule DbayWeb.PageController do
  use DbayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
