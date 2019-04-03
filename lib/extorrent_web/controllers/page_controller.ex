defmodule ExtorrentWeb.PageController do
  use ExtorrentWeb, :controller

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  def add(conn, %{"torrent" => torrent}) do
    case Extorrent.add_torrent(torrent.path) do
      {:error, reason} ->
        render(conn, "add.json", %{success: reason})

      _ ->
        render(conn, "add.json", %{success: :ok})
    end
  end
end
