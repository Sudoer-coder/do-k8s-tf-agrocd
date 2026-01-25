resource "digitalocean_project_resources" "this" {
  project = var.project_id

  resources = [
    digitalocean_kubernetes_cluster.this.urn,
    digitalocean_vpc.this.urn
  ]
}
