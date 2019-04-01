defmodule Extorrent.Torrent.Pool do
  @moduledoc """
    Creates a pool of supervised workers
  """
  use Supervisor

  alias Extorrent.Torrent.Supervisor, as: TorrentSupervisor

  @spec start_link :: Supervisor.on_start()
  def start_link do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  @spec add_torrent(binary, String.t()) :: Supervisor.on_start_child()
  def add_torrent(info_hash, name) do
    torrent = supervisor(TorrentSupervisor, [info_hash, name], id: info_hash, restart: :transient)

    Supervisor.start_child(__MODULE__, torrent)
  end

  @impl true
  def init([]) do
    children = []

    supervise(children, strategy: :one_for_one)
  end
end
