variable "secrets_keys" {
  type        = list
  description = "A list of keys in a map of secrets"
}

variable "secrets_map" {
  type        = map(string)
  description = "A map of secret names to their sensitive values"
  sensitive   = true
}