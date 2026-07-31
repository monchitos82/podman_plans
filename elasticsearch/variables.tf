variable "elastic_port" {
  description = "Port to expose Elasticsearch"
  type        = number
  default     = 9200
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "xpack_security" {
  type        = bool
  default     = false
}

variable "xpack_security_ssl" {
  type        = bool
  default     = false
}

variable "xpack_ml" {
  type        = bool
  default     = false
}

variable "discovery" {
  type        = string
  default     = "single-node"
}