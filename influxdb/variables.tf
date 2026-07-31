variable "influx_port" {
  description = "Port to expose InfluxDB"
  type        = number
  default     = 8086
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "influx_user" {
  type        = string
  default     = "influxadmin"
}

variable "influx_org" {
  type        = string
  default     = "local"
}

variable "influx_bucket" {
  type        = string
  default     = "local"
}
