# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :stop,
  ecto_repos: [Stop.Repo]

# Configures the endpoint
config :stop, StopWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: StopWeb.ErrorHTML, json: StopWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Stop.PubSub,
  live_view: [signing_salt: "1I+jFns9"]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ],
  react: [
    args: ~w(react/main.jsx --bundle --target=es2017 --outdir=../priv/static/assets/react),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
