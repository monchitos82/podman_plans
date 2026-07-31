variable "mariadb_port" {
  description = "Port to expose MariaDB"
  type        = number
  default     = 3306
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "mariadb_db" {
  type        = string
  default     = "mariadb"
}

variable "mariadb_user" {
  type        = string
  default     = "mariadb"
}
