resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.k8s_version

  vpc_uuid = digitalocean_vpc.this.id

  auto_upgrade  = true
  surge_upgrade = true
  ha            = false

  # Added Default node pool
  node_pool {
    name       = "system-pool"
    size       = var.nodepool_size
    node_count = 1
    tags = [
      "role:system",
      "env:${var.environment}"
    ]
  }

  tags = [
    "env:${var.environment}",
    "managed-by:terraform",
    "project:doks"
  ]

  lifecycle {
    prevent_destroy = true
  }
}
