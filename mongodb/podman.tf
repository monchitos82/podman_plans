resource "podman_container" "mongodb" {
  container_host = local.container_host
  name           = "mongodb"
  image          = "mongo:latest"
  
  port_mappings = [
    {
      container_port = var.mongodb_port
      host_port      = var.mongodb_port
    }
  ]

  mounts = [
    {
      target  = "/data/db"
      source  = "${var.volume_base_path}/mongodb-data/_data"
      options = ["Z"]
      type    = "bind"
    },
    {
      target  = "/data/configdb"
      source  = "${var.volume_base_path}/mongodb-config/_data"
      options = ["Z"]
      type    = "bind"
    } 
  ]
}
