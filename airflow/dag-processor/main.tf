
module "airflow-container" {
  source  = "../modules/airflow-container"
  name    = "airflow-dag-processor"
  command = ["airflow", "dag-processor"]
}
