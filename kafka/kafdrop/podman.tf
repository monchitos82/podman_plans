resource "podman_container" "kafka" {
  container_host = local.container_host
  name           = "kafdrop"
  image          = "obsidiandynamics/kafdrop:latest"
  
  port_mappings = [
    { container_port = var.kafdrop_port, host_port = var.kafdrop_port }
  ]

  env = {
    KAFKA_BROKERCONNECT        = "${var.kafka_broker_host}:${var.kafka_broker_port}"
    SERVER_SERVLET_CONTEXTPATH = "/"
    JVM_OPTS                   = "-Xms32M -Xmx64M"
  }
}

