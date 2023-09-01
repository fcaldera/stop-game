defmodule Stop.Repo do
  use Ecto.Repo,
    otp_app: :stop,
    adapter: Ecto.Adapters.SQLite3
end
