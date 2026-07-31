variable "valkey_port" {
  description = "Port to expose Valkey"
  type        = number
  default     = 6379
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}
