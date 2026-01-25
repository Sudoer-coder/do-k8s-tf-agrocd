resource "digitalocean_kubernetes_node_pool" "medium" {
  cluster_id = digitalocean_kubernetes_cluster.this.id

  name = "medium-pool"
  size = var.nodepool_size

  auto_scale = true
  min_nodes  = var.nodepool_min_nodes
  max_nodes  = var.nodepool_max_nodes

  tags = [
    "env:${var.environment}",
    "cluster:${var.cluster_name}"
  ]
}
