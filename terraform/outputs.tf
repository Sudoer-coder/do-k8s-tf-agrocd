# Cluster Outputs

output "cluster_id" {
  description = "DOKS cluster ID"
  value       = digitalocean_kubernetes_cluster.this.id
}

output "cluster_name" {
  description = "DOKS cluster name"
  value       = digitalocean_kubernetes_cluster.this.name
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint"
  value       = digitalocean_kubernetes_cluster.this.endpoint
}

output "cluster_region" {
  description = "Cluster region"
  value       = digitalocean_kubernetes_cluster.this.region
}

output "cluster_version" {
  description = "Kubernetes version"
  value       = digitalocean_kubernetes_cluster.this.version
}


# Node Pool Outputs

output "nodepool_id" {
  description = "Medium node pool ID"
  value       = digitalocean_kubernetes_node_pool.medium.id
}

output "nodepool_name" {
  description = "Medium node pool name"
  value       = digitalocean_kubernetes_node_pool.medium.name
}

output "nodepool_size" {
  description = "Droplet size for node pool"
  value       = digitalocean_kubernetes_node_pool.medium.size
}

output "nodepool_autoscaling" {
  description = "Autoscaling settings for node pool"
  value = {
    enabled = digitalocean_kubernetes_node_pool.medium.auto_scale
    min     = digitalocean_kubernetes_node_pool.medium.min_nodes
    max     = digitalocean_kubernetes_node_pool.medium.max_nodes
  }
}

# Network Outputs


output "vpc_id" {
  description = "VPC ID used by the cluster"
  value       = digitalocean_vpc.this.id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = digitalocean_vpc.this.ip_range
}


# Project Outputs


output "project_id" {
  description = "DigitalOcean Project ID"
  value       = var.project_id
}

output "argocd_info" {
  value = {
    url      = "https://${var.argocd_domain}"
    username = "admin" 
  }
}

output "argocd_password_command" {
  value = "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
}

# Link this back to your Ingress NGINX
output "ingress_load_balancer_ip" {
  value = data.kubernetes_service.ingress_nginx.status.0.load_balancer.0.ingress.0.ip
}