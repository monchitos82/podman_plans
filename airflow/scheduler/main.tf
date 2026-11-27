
module "airflow-container" {
  source  = "../modules/airflow-container"
  name    = "airflow-scheduler"
  command = ["airflow", "scheduler"]
}
