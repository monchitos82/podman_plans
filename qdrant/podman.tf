resource "podman_container" "qdrant" {
  container_host = local.container_host
  name           = "qdrant"
  image          = "qdrant:latest"

  port_mappings = [
    {
      container_port = var.qdrant_port
      host_port      = var.qdrant_port
    }
  ]

  mounts = [
    {
      target      = "/qdrant/storage"
      source      = "${var.volume_base_path}/qdrant-data/_data"
      options     = ["Z"]
      type        = "bind"
    }
  ]
}
