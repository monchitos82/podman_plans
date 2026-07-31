variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "statsd_ports" {
  description = "Ports to expose for statsd"
  type = list(object({
    container_port = number
    host_port      = number
    protocol       = optional(string, "tcp")
  }))
  default = [
    { container_port = 9125, host_port = 9125, protocol = "tcp" }
  ]
}
