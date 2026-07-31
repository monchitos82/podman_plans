resource "podman_container" "kafka" {
  container_host = local.container_host
  name           = "kafka"
  image          = "confluentinc/cp-kafka:latest"
  
  port_mappings = [
    { container_port = 9101,                      host_port = 9101 },
    { container_port = 9202,                      host_port = 9202 },
    { container_port = var.kafka_listener_port,   host_port = var.kafka_listener_port },
    { container_port = var.kafka_controller_port, host_port = var.kafka_controller_port },
  ]

  env = {
    KAFKA_NODE_ID                          = 1
    KAFKA_LISTENER_SECURITY_PROTOCOL_MAP   = var.kafka_controller_security_map
    KAFKA_ADVERTISED_LISTENERS             = "PLAINTEXT://kafka:,PLAINTEXT_HOST://${var.kafka_host}:9092"
    KAFKA_PROCESS_ROLES                    = "controller,broker"
    KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR = 1
    KAFKA_CONTROLLER_QUORUM_VOTERS         = "1@kafka:${var.kafka_controller_port}"
    KAFKA_LISTENERS                        = "PLAINTEXT://kafka:${var.kafka_listener_port},CONTROLLER://kafka:${var.kafka_controller_port},PLAINTEXT_HOST://0.0.0.0:9092"
    KAFKA_INTER_BROKER_LISTENER_NAME       = "PLAINTEXT"
    KAFKA_CONTROLLER_LISTENER_NAMES        = "CONTROLLER"
    CLUSTER_ID                             = var.kafka_cluster
  }

  mounts = [
    {
      target      = "/var/lib/kafka/data"
      source      = "${var.volume_base_path}/kafka-data/_data"
      options     = ["Z"]
      type        = "volume"
    },
    {
      target      = "/etc/kafka/secrets"
      source      = "${var.volume_base_path}/kafka-secrets/_data"
      options     = ["Z"]
      type        = "volume"
    }
  ]
}

