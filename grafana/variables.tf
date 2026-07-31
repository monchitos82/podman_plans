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
  description = "Host for Grafana service"
  type        = string
  default     = "host.containers.internal"
}

variable "use_mariadb" {
  description = "Use MariaDB as backend"
  type        = bool
  default     = true
}

variable "mariadb_host" {
  description = "MariaDB service host"
  type        = string
  default     = "host.containers.internal"
}

variable "mariadb_port" {
  description = "MariaDB service port"
  type        = number
  default     = 3306
}

variable "mariadb_user" {
  description = "MariaDB user for Grafana"
  type        = string
  default     = "grafana"
}

variable "mariadb_db" {
  description = "MariaDB database for Grafana"
  type        = string
  default     = "grafana"
}

variable "use_otel" {
  description = "Emit traces to OTEL"
  type        = bool
  default     = true
}

variable "otel_host" {
  description = "Host for OTEL collector"
  type        = string
  default     = "host.containers.internal"
}

variable "otel_port" {
  description = "Port for OTEL collector"
  type        = number
  default     = 4317
}

variable "otel_insecure" {
  description = "Connect to OTLP using HTTP"
  type        = bool
  default     = false
}