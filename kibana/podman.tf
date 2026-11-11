resource "podman_container" "kibana" {
  container_host = local.container_host
  name           = "kibana"
  image          = "docker.elastic.co/kibana/kibana:9.5.5"

  port_mappings = [
    for port in var.kibana_ports:
    {
      container_port = port
      host_port      = port
    }
  ]

  env = {
    "ELASTICSEARCH_HOSTS"               = join(",", var.elasticsearch_hosts)
  }

  secret_env = {
    "ELASTICSEARCH_SERVICEACCOUNTTOKEN" = "elasticsearch_serviceaccounttoken"
  }

  mounts = [
    {
      target  = "/usr/share/kibana/data"
      source  = "${var.volume_base_path}/kibana-data/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
