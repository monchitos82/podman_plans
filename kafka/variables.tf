variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "kafka_host" {
  type    = string
  default = "host.containers.internal"
}

variable "kafka_listener_port" {
  type    = number
  default = 29092
}

variable "kafka_controller_port" {
  type    = number
  default = 29093
}

variable "kafka_controller_security_map" {
  type    = string
  default = "CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT"
}

variable kafka_cluster {
  type    = string
  default = "kafka_cluster"
}