resource "podman_container" "grafana" {
  container_host = local.container_host
  name           = "grafana"
  image          = "grafana/grafana:latest"
  
  port_mappings = [
    {
      container_port = var.grafana_port
      host_port      = var.grafana_port
    }
  ]

  env = merge(
    var.use_mariadb ? {
      GF_DATABASE_TYPE = "mysql"
      GF_DATABASE_HOST = "${var.mariadb_host}:${var.mariadb_port}"
      GF_DATABASE_NAME = var.mariadb_db
      GF_DATABASE_USER = var.mariadb_user
    } : {},
    var.use_otel ? {
      GF_TRACING_OPENTELEMETRY_OTLP_ADDRESS  = "${var.otel_host}:${var.otel_port}"
      GF_TRACING_OPENTELEMETRY_OTLP_INSECURE = var.otel_insecure
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
