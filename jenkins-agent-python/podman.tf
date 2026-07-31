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

  secret_env = {
    NEOCITIES_API_KEY = "neocities_api_key"
  }

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
      source  = "${var.volume_base_path}/blog-data/_data"
      options = ["z", "rw"]
      type    = "bind"
    }  
  ]
}

// this step fixes permissions for this volume that is shared with nginx
resource "null_resource" "fix_blog_data_permissions" {
  depends_on = [podman_container.jenkins-agent-python]

  provisioner "local-exec" {
    command = "podman unshare chown 1000:1000 ${var.volume_base_path}/blog-data/_data"
  }
}
