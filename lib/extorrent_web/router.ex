defmodule ExtorrentWeb.Router do
  use ExtorrentWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExtorrentWeb do
    pipe_through :browser

    get("/", PageController, :index)
    post("/add", PageController, :add)
    get "/torrents", TorrentController, :status
    # resources "/torrents", TorrentController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExtorrentWeb do
  #   pipe_through :api
  # end
end
