let add_torrent = (file) => {
  let data = new FormData()
  data.append("torrent", file)

  fetch("/add", {
    method: "POST",
    body: data
  }).then(
    response => response.json()
  ).then(resp => {
    console.log("Status: ", resp.success)
  }).catch(
    error => console.log(error)
  )
}

let file_input = document.getElementById("add-torrent")

let on_file_select = () => add_torrent(file_input.files[0])

file_input.addEventListener("change", on_file_select, false)
