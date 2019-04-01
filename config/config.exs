# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :extorrent,
  ecto_repos: [Extorrent.Repo]

# Configures the endpoint
config :extorrent, ExtorrentWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jT6ldRLQOFjNEYgTesoYScDF95aR7lP9AwsmCmFG4VRTmoUfOyr8HGe4x1fQ/+K5",
  render_errors: [view: ExtorrentWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Extorrent.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :extorrent,
  peer_id: :crypto.strong_rand_bytes(20) |> Base.url_encode64() |> binary_part(0, 20),
  tcp_port: 6885,
  udp_port: Enum.random(21_001..22_000),
  download_dir: System.get_env("HOME") |> Path.join("Downloads")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

import_config "#{Mix.env()}.exs"
