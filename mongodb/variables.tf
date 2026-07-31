variable "mongodb_port" {
  description = "Port to expose MariaDB"
  type        = number
  default     = 27017
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}
