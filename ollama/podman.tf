resource "podman_container" "ollama" {
  container_host = local.container_host
  name           = "ollama"
  image          = "ollama:latest"
  devices        = var.ollama_use_gpu ? [
    {
      path      = "nvidia.com/gpu=all"
      host_path = "nvidia.com/gpu=all"
    }
  ] : []

  port_mappings = [
    {
      container_port = var.ollama_port
      host_port      = var.ollama_port
    }
  ]

  env = {
    OLLAMA_NO_CLOUD        = var.ollama_no_cloud
    OLLAMA_HOST            = var.ollama_host
    OLLAMA_FLASH_ATTENTION = var.ollama_flash_attention
    OLLAMA_VULKAN          = var.ollama_vulkan
    OLLAMA_NUM_PARALLEL    = var.ollama_num_parallel
    OLLAMA_CONTEXT_LENGTH  = var.ollama_context_length
    OLLAMA_IGPU_ENABLE     = var.ollama_igpu_enable
}


  mounts = [
    {
      target  = "/root/.ollama"
      source  = "${var.volume_base_path}/ollama-data/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
