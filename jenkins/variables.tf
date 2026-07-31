variable "jenkins_port" {
  description = "Port to expose Jenkins"
  type        = number
  default     = 10887
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}