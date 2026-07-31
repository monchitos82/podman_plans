resource "podman_container" "valkey" {
  container_host = local.container_host
  name           = "valkey"
  image          = "valkey/valkey:latest"

  command = ["valkey-server"]
  
  port_mappings = [
    {
      container_port = var.valkey_port
      host_port      = var.valkey_port
    }
  ]

  mounts = [
    {
      target  = "/data"
      source  = "${var.volume_base_path}/valkey-data/_data"
      options = ["Z"]
      type    = "volume"
    }
  ]
}
