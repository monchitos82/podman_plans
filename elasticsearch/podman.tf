resource "podman_container" "elasticsearch" {
  container_host = local.container_host
  name           = "elasticsearch"
  image          = "docker.elastic.co/elasticsearch/elasticsearch:9.5.5"

  port_mappings = [
    for port in var.elastic_ports:
    {
      container_port = port
      host_port      = port
    }
  ]

  env = {
    "xpack.security.enabled"          = var.xpack_security
    "xpack.security.http.ssl.enabled" = var.xpack_security_ssl
    "xpack.ml.enabled"                = var.xpack_ml
    "discovery.type"                  = var.discovery
  }

  provisioner "local-exec" {
      command = var.memory_config != null  ? "podman update --memory ${var.memory_config} ${self.name}" : "true"
  }

  mounts = [
    {
      target  = "/usr/share/elasticsearch/data"
      source  = "${var.volume_base_path}/elasticsearch-data/_data"
      options = ["z", "U"]
      type    = "bind"
    }
  ]
}
