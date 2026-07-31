variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "elasticsearch_host" {
  type    = string
  default = "host.containers.internal"
}

variable "elasticsearch_port" {
  type    = number
  default = 9200
}

variable "elasticsearch_index_prefix" {
  type    = string
  default = "jaeger"
}

variable "elasticsearch_tags_as_fields" {
  type    = bool
  default = true
}

