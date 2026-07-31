resource "podman_container" "grafana" {
  container_host = local.container_host
  name           = "grafana"
  image          = "grafana/grafana:latest"
  
  port_mappings = [
    {
      container_port = 3000
      host_port      = var.grafana_port
    }
  ]

  env = merge(
    var.use_mariadb ? {
      GF_DATABASE_TYPE = "mysql"
      GF_DATABASE_HOST = "host.containers.internal:3306"
      GF_DATABASE_NAME = "grafana"
      GF_DATABASE_USER = "grafana"
    } : {},
    var.use_otel ? {
      GF_TRACING_OPENTELEMETRY_OTLP_ADDRESS  = "host.containers.internal:4317"
      GF_TRACING_OPENTELEMETRY_OTLP_INSECURE = "true"
    } : {}
  )

  secret_env = var.use_mariadb ? {
    GF_DATABASE_PASSWORD = "gf_database_password"
  } : {}

  mounts = [
    {
      target      = "/var/lib/grafana"
      source      = "${var.volume_base_path}/grafana-data/_data"
      options     = ["Z"]
    },
    {
      target      = "/usr/share/grafana/conf"
      source      = "${var.volume_base_path}/grafana-config/_data"
      options     = ["Z"]
    }
  ]
}
