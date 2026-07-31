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
      target      = "/etc/nginx"
      source      = "${var.volume_base_path}/nginx-config/_data"
      options     = ["Z"]
      type        = "bind"
    },
    {
      target  = "/usr/share/nginx/html"
      source  = "${var.volume_base_path}/nginx-data/_data"
      options = ["z"]
      type    = "bind"
    }
  ]
}
