# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :host_echo,
  ecto_repos: [HostEcho.Repo]

# Configures the endpoint
config :host_echo, HostEchoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wBjdeW44ipTiwxhNw7JzFvZauQZP/MdGrNBPAOQdHbaOnkI4sUQbS2fHY7xZPrFN",
  render_errors: [view: HostEchoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: HostEcho.PubSub,
  live_view: [signing_salt: "thHjtAO3"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
