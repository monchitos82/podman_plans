variable "kafdrop_port" {
  type = number
  default = 9000
}

variable "kafka_broker_host" {
  type    = string
  default = "host.containers.internal"
}

variable "kafka_broker_port" {
  type    = number
  default = 29092
}
