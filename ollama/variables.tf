variable "ollama_port" {
  description = "Port to expose MariaDB"
  type        = number
  default     = 11434
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "ollama_no_cloud" {
  description = "Do not use ollama cloud"
  type        = string
  default     = "1"
}

variable "ollama_host" {
  description = "Ollama default host"
  type        = string
  default     = "0.0.0.0"
}

variable "ollama_flash_attention" {
  description = "Use flash attention"
  type        = string
  default     = "1"
}

variable "ollama_vulkan" {
  description = "Use vulkan controllers"
  type        = string
  default     = "1"
}

variable "ollama_num_parallel" {
  description = "Number of parallel prompts"
  type        = string
  default     = "1"
}

variable "ollama_context_length" {
  description = "Context window length"
  type        = string
  default     = "4096"
}

variable "ollama_igpu_enable" {
  description = "Use internal GPU"
  type        = string
  default     = "1"
}

variable "ollama_use_gpu" {
  description = "Use host GPUs"
  type        = bool
  default     = false
}
