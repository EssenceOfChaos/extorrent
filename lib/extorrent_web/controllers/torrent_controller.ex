defmodule ExtorrentWeb.TorrentController do
  use ExtorrentWeb, :controller

  def status(conn, _args) do
    dt = DateTime.utc_now()
    render(conn, "status.html", dt: dt)
  end
end
