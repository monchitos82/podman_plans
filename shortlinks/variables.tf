variable "server_host" {
  description = "Host to bind the API"
  type        = string
  default     = "0.0.0.0"
}

variable "server_port" {
  description = "Port to expose the API"
  type        = number
  default     = 8990
}

variable "templates_path" {
  description = "Path to HTML templates"
  type        = string
  default     = "/app/templates"
}

variable "config_file" {
  description = "Config file path or USE_VARS to use environment variables"
  type        = string
  default     = "USE_VARS"
}

variable "database_host" {
  type    = string
  default = "host.containers.internal"
}

variable "database_port" {
  type    = number
  default = 5432
}

variable "database_user" {
  type    = string
  default = "shortlinks"
}

variable "database_name" {
  type    = string
  default = "shortlinks"
}

variable "shortlinks_image" {
  description = "The local image name for the sortlinks project"
  type        = string
  default     = "localhost/shortlinks:latest"
}