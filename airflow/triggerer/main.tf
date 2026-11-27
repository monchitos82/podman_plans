
module "airflow-container" {
  source  = "../modules/airflow-container"
  name    = "airflow-triggerer"
  command = ["airflow", "triggerer"]

  port_mappings = [
    for key, value in var.airflow_ports:
    { container_port = key,  host_port = value }
  ]
}
