# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :statusboard,
  ecto_repos: [Statusboard.Repo]

# Configures the endpoint
config :statusboard, StatusboardWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3+KkoAfIJYCgqlHMbytGzMHZ4bYIjh9JVT9fw39Devhwq8zmo2+LA+1IFuF1Foai",
  render_errors: [view: StatusboardWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Statusboard.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
