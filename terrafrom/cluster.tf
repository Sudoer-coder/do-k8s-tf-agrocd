resource "digitalocean_kubernetes_cluster" "this" {
  name     = var.cluster_name
  region   = var.region

  vpc_uuid = digitalocean_vpc.this.id

  version = var.k8s_version

  auto_upgrade  = true
  surge_upgrade = true

  maintenance_policy {
    day        = "sunday"
    start_time = "04:00"
  }

  tags = ["prod", "autoscale"]
}
