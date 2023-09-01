defmodule StopWeb.PageController do
  use StopWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def react(conn, _params) do
    render(conn, :react, layout: false)
  end
end
