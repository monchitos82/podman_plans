variable "grafana_port" {
  description = "Port to expose Grafana"
  type        = number
  default     = 3000
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "grafana_db_host" {
  type    = string
  default = "host.containers.internal"
}

variable "use_mariadb" {
  description = "Use mariadb as backend"
  type        = bool
  default     = false
}

variable "use_otel" {
  description = "Emit traces to OTEL"
  type        = bool
  default     = false
}