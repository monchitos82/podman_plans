resource "podman_container" "kafka" {
  container_host = local.container_host
  name           = "kafka"
  image          = "apache/kafka:latest"
  
  port_mappings = [
    { container_port = 9101,                      host_port = 9101 },
    { container_port = 9202,                      host_port = 9202 },
    { container_port = var.kafka_listener_port,   host_port = var.kafka_listener_port },
    { container_port = var.kafka_controller_port, host_port = var.kafka_controller_port },
  ]

  env = {
    KAFKA_NODE_ID                            = 1
    KAFKA_LISTENER_SECURITY_PROTOCOL_MAP     = var.kafka_controller_security_map
    KAFKA_ADVERTISED_LISTENERS               = "PLAINTEXT://${var.kafka_host}:${var.kafka_listener_port},PLAINTEXT_HOST://${var.kafka_host}:${var.kafka_listener_port}"
    KAFKA_PROCESS_ROLES                      = "controller,broker"
    KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR   = 1
    KAFKA_CONTROLLER_QUORUM_VOTERS           = "1@kafka:${var.kafka_controller_port}"
    KAFKA_LISTENERS                          = "PLAINTEXT://0.0.0.0:${var.kafka_listener_port},CONTROLLER://0.0.0.0:${var.kafka_controller_port},PLAINTEXT_HOST://0.0.0.0:9092"
    KAFKA_INTER_BROKER_LISTENER_NAME         = "PLAINTEXT"
    KAFKA_CONTROLLER_LISTENER_NAMES          = "CONTROLLER"
    CLUSTER_ID                               = var.kafka_cluster
  }

  provisioner "local-exec" {
      command = var.memory_config != null  ? "podman update --memory ${var.memory_config} ${self.name}" : "true"
  }


  mounts = [
    {
      target      = "/var/lib/kafka/data"
      source      = "${var.volume_base_path}/kafka-data/_data"
      options     = ["Z"]
      type        = "bind"
    },
    {
      target      = "/etc/kafka/secrets"
      source      = "${var.volume_base_path}/kafka-secrets/_data"
      options     = ["Z"]
      type        = "bind"
    }
  ]
}

