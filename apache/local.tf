resource "local_file" "data" {
  content  = podman_container.web_server.name
  filename = "/home/mon/data.txt"
}