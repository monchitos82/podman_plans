resource "podman_container" "postgresql" {
  container_host = local.container_host
  name           = "postgresql"
  image          = "postgres:latest"
  
  port_mappings = [
    {
      container_port = var.postgresql_port
      host_port      = var.postgresql_port
    }
  ]

  env = {
    POSTGRES_DB   = var.postgresql_db
    POSTGRES_USER = var.postgresql_user
  }
    
  secret_env = {
    POSTGRES_PASSWORD = "postgres_password"
  }

  mounts = [
    {
      target  = "/var/lib/postgresql"
      source  = "${var.volume_base_path}/postgresql-data/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
