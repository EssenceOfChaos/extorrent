defmodule Extorrent.Peer.Manager do
  @moduledoc false
  use Supervisor

  @spec start_link(binary, pid, pid) :: Supervisor.on_start()
  def start_link(info_hash, control_pid, file_worker) do
    Supervisor.start_link(__MODULE__, [info_hash, control_pid, file_worker])
  end

  @spec start_peer_pool(pid) :: Supervisor.on_start_child()
  def start_peer_pool(pid) do
    child = supervisor(Extorrent.Peer.Pool, [])

    Supervisor.start_child(pid, child)
  end

  @impl true
  def init([info_hash, control_pid, file_worker]) do
    children = [
      worker(Extorrent.Peer.Control, [info_hash, control_pid, file_worker, self()])
    ]

    supervise(children, strategy: :one_for_all)
  end
end
