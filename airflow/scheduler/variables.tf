variable "airflow_core_executor" {
  description = "Airflow Core executor (celery, batch, edge)"
  type        = string
  default     = "CeleryExecutor"
}

variable "airflow_core_auth_manager_all_admins" {
  description = "Airflow Core simple auth manager: All Admins"
  type        = bool
  default     = false
}

variable "airflow_core_parallelism" {
  description = "Airflow Core parallelism"
  type        = number
  default     = 32
}

variable "airflow_core_dags_paused" {
  description = "Airflow Core DAGS paused at creation"
  type        = bool
  default     = true
}

variable "airflow_core_internal_api_url" {
  description = "Airflow Core internal API URL"
  type        = string
  default     = "http://host.containers.internal:8080"
}

variable "airflow_core_execution_api_server_url" {
  description = "Airflow Core execution API server URL"
  type        = string
  default     = "http://host.containers.internal:8080/execution/"
}

variable "airflow_database_sqlalchemy_pool" {
  description = "Airflow database SQLAlchemy pool enabled"
  type        = bool
  default     = true
}

variable "airflow_api_host" {
  description = "Airflow API host"
  type        = string
  default     = "0.0.0.0"
}

variable "airflow_api_port" {
  description = "Airflow API port"
  type        = number
  default     = 8080
}

variable "airflow_api_workers" {
  description = "Airflow API (Gunicorn) workers"
  type        = number
  default     = 4
}

variable "airflow_scheduler_host" {
  description = "Airflow Scheduler healthcheck server host"
  type        = string
  default     = "0.0.0.0"
}

variable "airflow_celery_broker_url" {
  description = "Airflow Celery Broker URL"
  type        = string
  default     = "redis://host.containers.internal:6379/2"
}

variable "airflow_celery_flower_host" {
  description = "Airflow Celery Flower host"
  type        = string
  default     = "0.0.0.0"
}

variable "airflow_celery_flower_port" {
  description = "Airflow Celery Flower port"
  type        = number
  default     = 5555
}

variable "airflow_celery_worker_concurrency" {
  description = "Airflow Celery worker concurrency"
  type        = number
  default     = 2
}

variable "airflow_metrics_statsd" {
  description = "Airflow metrics Statsd enabled"
  type        = bool
  default     = false
}

variable "airflow_metrics_statsd_host" {
  description = "Airflow metrics Statsd host"
  type        = string
  default     = "host.containers.internal"
}

variable "airflow_metrics_statsd_port" {
  description = "Airflow metrics Statsd port"
  type        = number
  default     = 9125
}

variable "airflow_metrics_otel" {
  description = "Airflow metrics OTEL enabled"
  type        = bool
  default     = false
}

variable "airflow_metrics_otel_host" {
  description = "Airflow metrics OTEL host"
  type        = string
  default     = "host.containers.internal"
}

variable "airflow_metrics_otel_port" {
  description = "Airflow metrics OTEL port"
  type        = number
  default     = 4318
}

variable "airflow_traces_otel" {
  description = "Airflow traces OTEL enabled"
  type        = bool
  default     = false
}

variable "airflow_traces_otel_host" {
  description = "Airflow traces OTEL host"
  type        = string
  default     = "host.containers.internal"
}

variable "airflow_traces_otel_port" {
  description = "Airflow traces OTEL port"
  type        = number
  default     = 4318
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}
