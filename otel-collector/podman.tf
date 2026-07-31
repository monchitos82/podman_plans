resource "podman_container" "otel_collector" {
  container_host = local.container_host
  name           = "otel-collector"
  image          = var.otel_image

  port_mappings = [
    { container_port = 1888,  host_port = 1888 },  # pprof extension
    { container_port = 8888,  host_port = 8888 },  # Prometheus metrics
    { container_port = 8889,  host_port = 8889 },  # Prometheus exporter
    { container_port = 13133, host_port = 13133 }, # Health check
    { container_port = 4317,  host_port = 4317 },  # OTLP gRPC
    { container_port = 4318,  host_port = 4318 },  # OTLP HTTP
    { container_port = 6831,  host_port = 6831 },  # Jaeger thrift compact
    { container_port = 9464,  host_port = 9464 },  # Prometheus exporter
    { container_port = 55679, host_port = 55679 }  # ZPages extension
  ]

  mounts = [
    {
      target  = "/etc/"
      source  = "${var.volume_base_path}/otel-config/_data"
      options = ["Z"]
    }
  ]
}
