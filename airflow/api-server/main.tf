
module "airflow-container" {
  source  = "../modules/airflow-container"
  name    = "airflow-api-server"
  command = ["airflow", "api-server"]

  port_mappings = [
    for key, value in var.airflow_ports:
    { container_port = key,  host_port = value }
  ]
}
