resource "podman_container" "jenkins" {
  container_host = local.container_host
  name           = "jenkins"
  image          = "jenkins/jenkins:latest"
  
  port_mappings = [
    for port in var.jenkins_ports:
    {
      container_port = port
      host_port      = port
    }
  ]

  env = {
    JENKINS_OPTS = "--httpPort=${var.default_jenkins_port}"
  }

  mounts = [
    {
      target  = "/var/jenkins_home"
      source  = "${var.volume_base_path}/jenkins-data/_data"
      options = ["Z"]
    }
  ]
}
