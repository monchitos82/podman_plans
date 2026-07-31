resource "podman_container" "jenkins" {
  container_host = local.container_host
  name           = "jenkins"
  image          = "jenkins/jenkins:latest"
  
  port_mappings = [
    {
      container_port = var.jenkins_port
      host_port      = var.jenkins_port
    },
    {
        container_port = 50000,
        host_port      = 50000
    }
  ]

  env = {
    JENKINS_OPTS = "--httpPort=${var.jenkins_port}"
  }

  mounts = [
    {
      target  = "/var/jenkins_home"
      source  = "${var.volume_base_path}/jenkins-data/_data"
      options = ["Z"]
    }
  ]
}
