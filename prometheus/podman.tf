resource "podman_container" "prometheus" {
  container_host = local.container_host
  name           = "prometheus"
  image          = "prom/prometheus:latest"
  
  port_mappings = [
    for key, value in var.prometheus_ports:
    { container_port = key,  host_port = value }
  ]


  mounts = [
    {
      target      = "/prometheus"
      source      = "${var.volume_base_path}/prometheus-data/_data"
      options     = ["z", "U"]
      type        = "bind"
    },
    {
      target      = "/etc/prometheus"
      source      = "${var.volume_base_path}/prometheus-config/_data"
      options     = ["z", "U"]
      type        = "bind"
    }
  ]
}
