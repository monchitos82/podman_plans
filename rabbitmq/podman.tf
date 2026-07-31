resource "podman_container" "rabbitmq" {
  container_host = local.container_host
  name           = "rabbitmq"
  image          = "rabbitmq:management"
  
  port_mappings = [
    { container_port = 5672,  host_port = 5672 },
    { container_port = 15672, host_port = 15672 }
  ]

  mounts = [
    {
      target  = "/var/lib/rabbitmq"
      source  = "${var.volume_base_path}/rabbitmq-data/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
