variable "airflow_ports" {
  description = "Ports to expose for Airflow"
  type        = map
  default     = {
    "8080" = "8080"
  }
}
