resource "podman_container" "nginx" {
  container_host = local.container_host
  name           = "nginx"
  image          = "nginx:latest"
  
  port_mappings = [
    for key, value in var.nginx_ports:
    { container_port = key,  host_port = value }
  ]


  mounts = [
    {
      target  = "/usr/share/nginx/html/"
      source  = "${var.volume_base_path}/blog-data/_data"
      options = ["z", "ro"]
      type    = "bind"
    }
  ]
}
