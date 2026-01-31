resource "digitalocean_kubernetes_node_pool" "medium" {
  cluster_id = digitalocean_kubernetes_cluster.this.id

  name = "medium-pool"
  size = var.nodepool_size

  auto_scale = true
  min_nodes  = var.mid_nodepool_min_nodes
  max_nodes  = var.mid_nodepool_max_nodes

  labels = {
    pool  = "medium"
    phase = "scale"
    role  = "workload"
  }

  tags = [
    "pool:medium",
    "phase:scale",
    "env:${var.environment}"
  ]
}