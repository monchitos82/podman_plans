variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "prometheus_ports" {
  description = "Ports to expose for prometheus"
  type        = map
  default     = {
    "9090" = "9090"
  }
}

