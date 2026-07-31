variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "nginx_ports" {
  description = "Ports to expose for nginx"
  type        = map
  default     = {
    "2080" = "2080"
  }
}
