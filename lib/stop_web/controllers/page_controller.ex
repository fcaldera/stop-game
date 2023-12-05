defmodule StopWeb.PageController do
  use StopWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:styles, ~p"/styles/home.css")
    |> render(:home)
  end
end
