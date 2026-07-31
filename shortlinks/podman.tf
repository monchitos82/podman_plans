resource "podman_container" "shortlinks" {
  container_host = local.container_host
  name           = "shortlinks"
  image          = var.shortlinks_image
  
  port_mappings = [
    {
      container_port = var.server_port
      host_port      = var.server_port
    }
  ]

  env = {
    CONFIG_FILE    = var.config_file
    SERVER_HOST    = var.server_host
    SERVER_PORT    = var.server_port
    TEMPLATES_PATH = var.templates_path
    DATABASE_HOST  = var.database_host
    DATABASE_PORT  = var.database_port
    DATABASE_NAME  = var.database_name
    DATABASE_USER  = var.database_user
  }

  secret_env = {
    DATABASE_PASSWORD = "shortlinks_database_password"
  }
}
