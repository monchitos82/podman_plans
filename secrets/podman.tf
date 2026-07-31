resource "podman_secret" "podman_secrets" {
  for_each = toset(var.secrets_keys)

  name           = each.value
  value          = var.secrets_map[each.value]
  container_host = local.container_host
  value_version  = 1
}