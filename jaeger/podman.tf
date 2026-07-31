resource "podman_container" "jaeger" {
  container_host = local.container_host
  name           = "jaeger"
  image          = "jaegertracing/jaeger:latest"
  
  port_mappings = [
    for port in var.jaeger_ports:
    { container_port = port,  host_port = port }
  ]


  env = {
    ES_SERVER_URLS    = "http://${var.elasticsearch_host}:${var.elasticsearch_port}"
    ES_INDEX_PREFIX   = var.elasticsearch_index_prefix
    ES_TAGS_AS_FIELDS = var.elasticsearch_tags_as_fields
  }

  mounts = [
    {
      target      = "/tmp"
      source      = "${var.volume_base_path}/jaeger-tmp/_data"
      options     = ["Z"]
      type        = "volume"
    }
  ]
}
