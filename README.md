# Extorrent

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

---

Data is encoded using a serialization protocol called bencoding.
HTTP GET req to tracker announce URL to get a list of available peers.
Client connects to peers using TCP sockets.
Spec outlines a number of messages each peer should respond to.
Torrent Strategy - download all blocks of all pieces as efficiently as possible and reassemble them into a complete output file set.

- Identity
- Discover
- Exchange
