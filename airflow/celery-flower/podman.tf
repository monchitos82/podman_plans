resource "podman_container" "airflow" {
  container_host = local.container_host
  name           = "airflow-celery-flower"
  image          = "apache/airflow:latest"
  command        = ["airflow", "celery", "flower"]

  port_mappings = [
    for key, value in var.airflow_ports:
    { container_port = key,  host_port = value }
  ]

  env = {
    AIRFLOW__CORE__EXECUTOR                                = var.airflow_core_executor
    AIRFLOW__CORE__SIMPLE_AUTH_MANAGER_ALL_ADMINS          = var.airflow_core_auth_manager_all_admins
    AIRFLOW__CORE__PARALLELISM                             = var.airflow_core_parallelism
    AIRFLOW__CORE__DAGS_ARE_PAUSED_AT_CREATION             = var.airflow_core_dags_paused
    AIRFLOW__CORE__INTERNAL_API_URL                        = var.airflow_core_internal_api_url
    AIRFLOW__CORE__EXECUTION_API_SERVER_URL                = var.airflow_core_execution_api_server_url
    AIRFLOW__DATABASE__SQL_ALCHEMY_POOL_ENABLED            = var.airflow_database_sqlalchemy_pool
    AIRFLOW__API__HOST                                     = var.airflow_api_host
    AIRFLOW__API__PORT                                     = var.airflow_api_port
    AIRFLOW__API__WORKERS                                  = var.airflow_api_workers
    AIRFLOW__SCHEDULER__SCHEDULER_HEALTH_CHECK_SERVER_HOST = var.airflow_scheduler_host
    AIRFLOW__CELERY__BROKER_URL                            = var.airflow_celery_broker_url
    AIRFLOW__CELERY__FLOWER_HOST                           = var.airflow_celery_flower_host
    AIRFLOW__CELERY__FLOWER_PORT                           = var.airflow_celery_flower_port
    AIRFLOW__CELERY__WORKER_CONCURRENCY                    = var.airflow_celery_worker_concurrency
    AIRFLOW__METRICS__STATSD_ON                            = var.airflow_metrics_statsd
    AIRFLOW__METRICS__STATSD_HOST                          = var.airflow_metrics_statsd_host
    AIRFLOW__METRICS__STATSD_PORT                          = var.airflow_metrics_statsd_port
    AIRFLOW__METRICS__OTEL_ON                              = var.airflow_metrics_otel
    AIRFLOW__METRICS__OTEL_HOST                            = var.airflow_metrics_otel_host
    AIRFLOW__METRICS__OTEL_PORT                            = var.airflow_metrics_otel_port
    AIRFLOW__TRACES__OTEL_ON                               = var.airflow_traces_otel
    AIRFLOW__TRACES__OTEL_HOST                             = var.airflow_traces_otel_host
    AIRFLOW__TRACES__OTEL_PORT                             = var.airflow_traces_otel_port
  }

  secret_env = {
    AIRFLOW__CELERY__RESULT_BACKEND     = "airflow_celery_result_backend"
    AIRFLOW__DATABASE__SQL_ALCHEMY_CONN = "airflow_database_sql_alchemy_conn"
  }

  mounts = [
    {
      target  = "/opt/airflow"
      source  = "${var.volume_base_path}/airflow-data/_data"
      options = ["z", "U"]
      type    = "bind"
    },
    {
      target  = "/opt/airflow/config"
      source  = "${var.volume_base_path}/airflow-config/_data"
      options = ["z", "U"]
      type    = "bind"
    },
    {
      target  = "/opt/airflow/dags"
      source  = "${var.volume_base_path}/airflow-dags/_data"
      options = ["z", "U"]
      type    = "bind"
    },
    {
      target  = "/opt/airflow/logs"
      source  = "${var.volume_base_path}/airflow-logs/_data"
      options = ["z", "U"]
      type    = "bind"
    },
    {
      target  = "/opt/airflow/plugins"
      source  = "${var.volume_base_path}/airflow-plugins/_data"
      options = ["z", "U"]
      type    = "bind"
    }
  ]
}
