resource "podman_container" "influxdb" {
  container_host = local.container_host
  name           = "influxdb"
  image          = "influxdb:2"
  
  port_mappings = [
    {
      container_port = var.influx_port
      host_port      = var.influx_port
    }
  ]

  env = {
    DOCKER_INFLUXDB_INIT_MODE     = "setup"
    DOCKER_INFLUXDB_INIT_USERNAME = var.influx_user
    DOCKER_INFLUXDB_INIT_ORG      = var.influx_org
    DOCKER_INFLUXDB_INIT_BUCKET   = var.influx_bucket
  }

  secret_env = {
    DOCKER_INFLUXDB_INIT_PASSWORD = "docker_influxdb_init_password"
  }

  mounts = [
    {
      target  = "/var/lib/influxdb2"
      source  = "${var.volume_base_path}/influx-data/_data"
      options = ["Z"]
    },
    {
      target  = "/etc/influxdb2"
      source  = "${var.volume_base_path}/influx-config/_data"
      options = ["Z"]
    }
  ]
}
