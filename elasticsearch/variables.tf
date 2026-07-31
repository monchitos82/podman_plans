variable "elastic_ports" {
  description = "Port to expose Elasticsearch"
  type        = list
  default     = [9200]
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "xpack_security" {
  description = "Settings for xpack (enabled by default)"
  type        = bool
  default     = true
}

variable "xpack_security_ssl" {
  description = "Settings for xpack, use SSL (enabled by default)"
  type        = bool
  default     = true
}

variable "xpack_ml" {
  description = "Settings for xpack, use machine-learning (enabled by default)"
  type        = bool
  default     = true
}

variable "discovery" {
  description = "Setting to enable discovery for multi-node"
  type        = string
  default     = "multi-node"
}

variable "memory_config" {
  description = "Memory config for the container"
  type        = string
  default     = null 
}