resource "podman_container" "jaeger" {
  container_host = local.container_host
  name           = "jaeger"
  image          = "jaegertracing/jaeger:latest"
  
  port_mappings = [
    for key, value in var.jaeger_ports:
    { container_port = key,  host_port = value }
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
      options     = ["z", "U"]
      type        = "bind"
    }
  ]
}
