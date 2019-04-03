# Extorrent

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `cd assets && npm install`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

```elixir
iex(16)> download_dir = Application.get_env(:extorrent, :download_dir)
"/Users/Freddy/Downloads"
iex(17)> Extorrent.Torrent.parse_file("assets/static/files/puppy.torrent")
{:ok,
 %Extorrent.Torrent{
   downloaded: 0,
   files: [{"/Users/Freddy/Downloads/puppy.jpg", 124234}],
   info_hash: <<17, 126, 58, 102, 101, 232, 255, 27, 21, 126, 94, 195, 120, 35,
     87, 138, 219, 138, 113, 43>>,
   left: 124234,
   name: "puppy.jpg",
   piece_length: 16384,
   pieces: %{
     0 => {<<84, 226, 107, 138, 47, 132, 95, 40, 193, 83, 17, 104, 37, 176, 207,
        240, 43, 93, 113, 39>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 0, 16384}]},
     1 => {<<66, 24, 238, 217, 160, 58, 176, 141, 246, 239, 112, 34, 182, 106,
        150, 194, 135, 252, 167, 49>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 16384, 16384}]},
     2 => {<<45, 103, 34, 24, 188, 115, 40, 27, 15, 154, 155, 140, 86, 195, 240,
        61, 149, 104, 175, 109>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 32768, 16384}]},
     3 => {<<23, 97, 156, 110, 70, 175, 50, 127, 253, 133, 176, 78, 13, 183,
        199, 169, 212, 95, 145, 30>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 49152, 16384}]},
     4 => {<<34, 50, 251, 254, 164, 39, 145, 119, 79, 229, 236, 149, 45, 59, 4,
        215, 162, 23, 181, 216>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 65536, 16384}]},
     5 => {<<145, 154, 186, 76, 38, 249, 213, 240, 243, 48, 31, 235, 68, 95, 57,
        183, 237, 9, 92, 157>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 81920, 16384}]},
     6 => {<<168, 79, 230, 104, 44, 110, 26, 53, 103, 216, 40, 169, 145, 228,
        187, 145, 44, 149, 92, 223>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 98304, 16384}]},
     7 => {<<176, 165, 37, 188, 154, 85, 134, 228, 25, 158, 129, 67, 7, 62, 216,
        217, 100, 102, 134, 175>>,
      [{"/Users/Freddy/Downloads/puppy.jpg", 114688, 9546}]}
   },
   size: 124234,
   trackers: ["udp://tracker.coppersurfer.tk:6969/announce"],
   uploaded: 0
 }}
```

---

Data is encoded using a serialization protocol called bencoding.
HTTP GET req to tracker announce URL to get a list of available peers.
Client connects to peers using TCP sockets.
Spec outlines a number of messages each peer should respond to.
Torrent Strategy - download all blocks of all pieces as efficiently as possible and reassemble them into a complete output file set.

- Identity
- Discover
- Exchange
