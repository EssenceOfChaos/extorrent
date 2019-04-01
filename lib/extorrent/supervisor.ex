defmodule Extorrent.Supervisor do
  @moduledoc """
  Main supervisor for Extorrent
  """

  use Supervisor

  @spec start_link(list) :: Supervisor.on_start()
  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init([peer_id, tcp_port, udp_port]) do
    children = [
      supervisor(Extorrent.Torrent.Pool, []),
      supervisor(Extorrent.Tracker.Pool, [peer_id, tcp_port, udp_port]),
      worker(Extorrent.Torrent.Table, [peer_id]),
      worker(Extorrent.UPnP, [tcp_port]),
      worker(Extorrent.Listener, [tcp_port])
    ]

    supervise(children, strategy: :one_for_all)
  end
end
