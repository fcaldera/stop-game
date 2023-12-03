defmodule StopWeb.Router do
  use StopWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {StopWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_player
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StopWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/react/*path", PageController, :react
  end

  # Other scopes may use custom stacks.
  scope "/api", StopWeb do
    pipe_through :api

    resources "/games", GameController, except: [:new, :edit] do
      resources "/players", PlayerController, except: [:new, :edit, :delete]
    end
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:stop, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: StopWeb.Telemetry
    end
  end

  defp fetch_current_player(conn, _) do
    if player = get_session(conn, :current_player) do
      assign(conn, :current_player, player)
    else
      new_uuid = Ecto.UUID.generate()

      conn
      |> assign(:current_player, new_uuid)
      |> put_session(:current_player, new_uuid)
    end
  end
end
