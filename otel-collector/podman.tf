resource "podman_container" "otel_collector" {
  container_host = local.container_host
  name           = "otel-collector"
  image          = var.otel_image

  port_mappings = [
    for port in var.otel_ports:
      { container_port = port,  host_port = port }
  ]

  mounts = [
    {
      target  = "/etc/"
      source  = "${var.volume_base_path}/otel-config/_data"
      options = ["Z"]
      type    = "volume"
    }
  ]
}
