# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :canvas_api,
  namespace: CanvasAPI,
  ecto_repos: [CanvasAPI.Repo]

# Configures the endpoint
config :canvas_api, CanvasAPI.Endpoint,
  instrumenters: [Appsignal.Phoenix.Instrumenter],
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: CanvasAPI.ErrorView, accepts: ~w(json)],
  pubsub: [name: CanvasAPI.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :canvas_api, CanvasAPI.Repo,
  loggers: [Appsignal.Ecto]

config :phoenix, :format_encoders,
  json: CanvasAPI.JSONEncoder

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Configure JSON API mime type
config :plug, :types, %{
  "application/vnd.json+api" => ~w(json-api)
}

# Configure Appsignal
config :appsignal, :config,
  name: :canvas_api,
  env: Mix.env,
  revision: "dev"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
