variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "postgresql_user" {
  description = "Default postgres user"
  type        = string
  default     = "postgresql"
}

variable "postgresql_db" {
  description = "Default postgres database"
  type        = string
  default     = "postgresql"
}

variable "postgresql_port" {
  description = "Default postgres port"
  type        = number
  default     = 5432
}

variable "is_replica" {
  description = "Is the instance a replica"
  type        = bool
  default     = false
}