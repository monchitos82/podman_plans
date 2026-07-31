resource "podman_container" "mariadb" {
  container_host = local.container_host
  name           = "mariadb"
  image          = "mariadb:latest"
  
  port_mappings = [
    {
      container_port = var.mariadb_port
      host_port      = var.mariadb_port
    }
  ]

  env = {
    MYSQL_DATABASE = var.mariadb_db
    MYSQL_USER     = var.mariadb_user
  }

  secret_env = {
    MYSQL_PASSWORD = "mysql_password"
  }

  mounts = [
    {
      target  = "/var/lib/mysql"
      source  = "${var.volume_base_path}/mariadb-data/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
