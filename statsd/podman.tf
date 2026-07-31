resource "podman_container" "statsd" {
  container_host = local.container_host
  name           = "statsd"
  image          = "prom/statsd-exporter"

  port_mappings = [
      for port in var.statsd_ports : {
        container_port = port.container_port
        host_port      = port.host_port
        protocol       = port.protocol
      }
    ]

  mounts = []
}
