variable "openwebui_port" {
  description = "Port to expose openwebui"
  type        = number
  default     = 10810
}

variable "volume_base_path" {
  description = "Base path for container volumes"
  type        = string
  default     = "/home/mon/.local/share/containers/storage/volumes"
}

variable "ollama_base_url" {
  description = "Ollama API base URL"
  type        = string
  default     = "http://host.containers.internal:11434"
}

variable "database_url" {
  description = "Default database URL"
  type        = string
  default     = "sqlite:///data/webui.db"
}
variable "vector_db" {
  description = "Default vector db"
  type        = string
  default     = "chroma"
}

variable "qdrant_uri" {
  description = "Default Qdrant URL"
  type        = string
  default     = ""
}

variable "redis_url" {
  description = "Default Redis URL"
  type        = string
  default     = ""
}

variable "rag_embedding_model" {
  description = "RAG embedding model name"
  type        = string
  default     = ""
}

variable "rag_embedding_engine" {
  description = "RAG embedding engine name"
  type        = string
  default     = "ollama"
}

variable "rag_embedding_model_auto_update" {
  description = "Auto update RAG embedding model"
  type        = bool
  default     = false
}

variable "enable_rag_web_search" {
  description = "RAG web search enabled"
  type        = bool
  default     = false
}

variable "rag_top_k" {
  description = "RAG top K results"
  type        = number
  default     = 3
}

variable "chunk_size" {
  description = "Document chunk size"
  type        = number
  default     = 1000
}

variable "chunk_overlap" {
  description = "Overlap between chunks"
  type        = number
  default     = 100
}

variable "openwebui_use_gpu" {
  description = "Use host GPUs"
  type        = bool
  default     = false
}
