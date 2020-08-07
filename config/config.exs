# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kusina,
  ecto_repos: [Kusina.Repo]

# Configures the endpoint
config :kusina, KusinaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+HABISq4c08qqnlajk+r06mqmaGyNXahfsjKuLWkCOwr7hKQWiQOiUUVNoyB/PaU",
  render_errors: [view: KusinaWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Kusina.PubSub,
  live_view: [signing_salt: "bsouhlAvbufXCfE4oBf0i8dgj4IOjHrv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
