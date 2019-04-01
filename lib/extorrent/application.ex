defmodule Extorrent.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    peer_id = Application.get_env(:extorrent, :peer_id)
    tcp_port = Application.get_env(:extorrent, :tcp_port)
    udp_port = Application.get_env(:extorrent, :udp_port)
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Extorrent.Repo,
      # Start the endpoint when the application starts
      ExtorrentWeb.Endpoint,
      {Extorrent.Supervisor, [peer_id, tcp_port, udp_port]}
      # Starts a worker by calling: Extorrent.Worker.start_link(arg)
      # {Extorrent.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Extorrent.ApplicationSupervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ExtorrentWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
