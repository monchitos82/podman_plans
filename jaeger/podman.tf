resource "podman_container" "jaeger" {
  container_host = local.container_host
  name           = "jaeger"
  image          = "jaegertracing/jaeger:latest"
  
  port_mappings = [
    { container_port = 16686,  host_port = 16686 },
    { container_port = 14317,  host_port = 14317 },
    { container_port = 14318,  host_port = 14318 },
    { container_port = 9411,   host_port = 9411 }
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
    }
  ]
}
