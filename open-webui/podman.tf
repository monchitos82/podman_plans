resource "podman_container" "open-webui" {
  container_host = local.container_host
  name           = "open-webui"
  image          = "ghcr.io/open-webui/open-webui:main"
  devices        = var.openwebui_use_gpu ? [
    {
      path      = "nvidia.com/gpu=all"
      host_path = "nvidia.com/gpu=all"
    }
  ] : []

  port_mappings = [
    {
      container_port = var.openwebui_port
      host_port      = var.openwebui_port
    }
  ]

  env = {
    OLLAMA_BASE_URL                 = var.ollama_base_url
    DATABASE_URL                    = var.database_url
    VECTOR_DB                       = var.vector_db
    QDRANT_URI                      = var.qdrant_uri
    REDIS_URL                       = var.redis_url
    RAG_EMBEDDING_MODEL             = var.rag_embedding_model
    RAG_EMBEDDING_ENGINE            = var.rag_embedding_engine
    RAG_EMBEDDING_MODEL_AUTO_UPDATE = var.rag_embedding_model_auto_update
    ENABLE_RAG_WEB_SEARCH           = var.enable_rag_web_search
    RAG_TOP_K                       = var.rag_top_k
    CHUNK_SIZE                      = var.chunk_size
    CHUNK_OVERLAP                   = var.chunk_overlap
    PORT                            = var.openwebui_port
}

  mounts = [
    {
      target  = "/app/backend/data"
      source  = "${var.volume_base_path}/openwebui-data/_data"
      options = ["Z"]
      type    = "bind"
    }
  ]
}
