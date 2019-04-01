defmodule ExtorrentWeb.PageView do
  use ExtorrentWeb, :view
  def render("add.json", %{success: success, token: token}) do
    %{success: success, token: token}
  end
end
