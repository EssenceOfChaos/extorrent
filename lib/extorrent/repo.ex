defmodule Extorrent.Repo do
  use Ecto.Repo,
    otp_app: :extorrent,
    adapter: Ecto.Adapters.Postgres
end
