resource "podman_container" "jenkins-agent-python" {
  container_host = local.container_host
  name           = "jenkins-agent-python"
  image          = "jenkins-agent-python:latest"

  command = [
    "-url",
    "http://${var.jenkins_master_host}:${var.jenkins_master_port}",
    "-secret",
    var.jenkins_master_secret,
    "-name",
    "python-agent",
    "-webSocket",
    "-workDir",
    "/home/jenkins/agent"
  ]

  mounts = [
    {
      target  = "/home/jenkins/"
      source  = "${var.volume_base_path}/jenkins-agent-data/_data"
      options = ["Z"]
      type    = "bind"
    },
    {
      target  = "/home/jenkins/agent"
      source  = "${var.volume_base_path}/jenkins-agent-agent/_data"
      options = ["Z"]
      type    = "bind"
    },
    {
      target  = "/home/jenkins/.jenkins"
      source  = "${var.volume_base_path}/jenkins-agent-jenkins/_data"
      options = ["Z"]
      type    = "bind"
    },
    {
      target  = "/opt/deploy/"
      source  = "${var.volume_base_path}/nginx-data/_data"
      options = ["Z"]
      type    = "bind"
    }  
  ]
}
