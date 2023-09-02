defmodule StopWeb.PageController do
  use StopWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/react")
  end

  def react(conn, _params) do
    render(conn, :react, layout: false)
  end
end
