variable "kibana_ports" {
  description = "Port to expose Kibana"
  type        = list
  default     = [5601]
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "elasticsearch_hosts" {
  description = "Elasticsearch host URLs"
  type        = list
  default     = ["http://host.containers.internal/9200"]
}
