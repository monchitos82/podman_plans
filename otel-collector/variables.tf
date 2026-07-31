variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "otel_image" {
  description = "The local image name for the OTEL collector"
  type        = string
  default     = "localhost/otel-collector:latest"
}

variable "otel_ports" {
  description = "List of ports to map in the container"
  type = list
  default = [4317, 4318]
}
