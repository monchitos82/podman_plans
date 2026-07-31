resource "podman_container" "prometheus" {
  container_host = local.container_host
  name           = "prometheus"
  image          = "prom/prometheus:latest"
  
  port_mappings = [
    for port in var.prometheus_ports:
    { container_port = port,  host_port = port }
  ]

  mounts = [
    {
      target      = "/prometheus"
      source      = "${var.volume_base_path}/prometheus-data/_data"
      options     = ["Z"]
      type        = "bind"
    },
    {
      target      = "/etc/prometheus"
      source      = "${var.volume_base_path}/prometheus-config/_data"
      options     = ["Z"]
      type        = "bind"
    }
  ]
}
