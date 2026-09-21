variable "victoriametrics_port" {
  description = "Port to expose VictoriaMetrics"
  type        = number
  default     = 8428
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "victoriametrics_retention_period" {
  description = "Default retention period"
  type        = string
  default     = "1y"
}
