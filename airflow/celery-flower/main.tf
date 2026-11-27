
module "airflow-container" {
  source  = "../modules/airflow-container"
  name    = "airflow-celery-flower"
  command = ["airflow", "celery", "flower"]

  port_mappings = [
    for key, value in var.airflow_ports:
    { container_port = key,  host_port = value }
  ]
}
