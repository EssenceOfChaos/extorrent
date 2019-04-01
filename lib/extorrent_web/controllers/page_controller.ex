defmodule ExtorrentWeb.PageController do
  use ExtorrentWeb, :controller

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    render(conn, "index.html")
  end

  @spec add(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def add(conn, %{"torrent" => torrent}) do
    case Extorrent.add_torrent(torrent.path) do
      {:error, reason} ->
        render(conn, "add.json", %{success: reason, token: get_csrf_token()})

      _ ->
        render(conn, "add.json", %{success: :ok, token: get_csrf_token()})
    end
  end
end
