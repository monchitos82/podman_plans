variable "jenkins_master_host" {
  description = "Jenkins master host"
  type        = string
  default     = "host.containers.internal"
}

variable "jenkins_master_port" {
  description = "Jenkins master listening port"
  type        = number
  default     = 10887
}

variable "jenkins_master_secret" {
  description = "API Key exposed by the master"
  type        = string
  default     = ""
  nullable    = false
  sensitive   = true
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}