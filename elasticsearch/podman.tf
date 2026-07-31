resource "podman_container" "elasticsearch" {
  container_host = local.container_host
  name           = "elasticsearch"
  image          = "docker.elastic.co/elasticsearch/elasticsearch:9.0.3"

  port_mappings = [
    {
      container_port = var.elastic_port
      host_port      = var.elastic_port
    },
    {
      container_port = 9300
      host_port = 9300
    }
  ]

  env = {
    "xpack.security.enabled"          = var.xpack_security
    "xpack.security.http.ssl.enabled" = var.xpack_security_ssl
    "xpack.ml.enabled"                = var.xpack_ml
    "discovery.type"                  = var.discovery
  }

  provisioner "local-exec" {
    command = "podman update --memory 2g ${self.name}"
  }
}
