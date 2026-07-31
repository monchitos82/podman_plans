resource "podman_image" "apache" {
  container_host = local.container_host
  reference      = "docker.io/library/httpd:latest"
}

resource "podman_container" "web_server" {
  container_host = local.container_host
  name           = "apache-http-server"
  image          = podman_image.apache.reference

  port_mappings = [
    {
      container_port = 80
      host_port      = var.host_port
    }
  ]
}

output "captured_container_name" {
  description = "The name of the container that was created"
  value       = podman_container.web_server.name
}

output "containers" {
  description = "existing containers"
  value       = local.container_host
}