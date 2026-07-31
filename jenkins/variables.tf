variable "default_jenkins_port" {
  description = "Base port to expose Jenkins"
  type        = number
  default     = 10887
}

variable "jenkins_ports" {
  description = "Ports to expose Jenkins"
  type        = list
  default     = [10887]
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}