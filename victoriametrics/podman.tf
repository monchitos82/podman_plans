resource "podman_container" "victoriametrics" {
  container_host = local.container_host
  name           = "victoriametrics"
  image          = "victoriametrics/victoria-metrics:latest"
  
  port_mappings = [
    {
      container_port = var.victoriametrics_port
      host_port      = var.victoriametrics_port
    }
  ]

  env = {
    VM_retentionPeriod = var.victoriametrics_retention_period
    VM_storageDataPath = "/storage"
  }

  mounts = [
    {
      target  = "/storage"
      source  = "${var.volume_base_path}/victoriametrics/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
