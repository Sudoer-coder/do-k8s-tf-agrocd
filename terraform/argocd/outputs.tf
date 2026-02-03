output "argocd_namespace" {
  value = kubernetes_namespace.argocd.metadata[0].name
}

output "argocd_url" {
  value = "http://${var.argocd_domain}"
}

output "argocd_password_command" {
  value = "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
  description = "Run this command to get the ArgoCD admin password"
}

output "argocd_server_service" {
  value = "argocd-server.${kubernetes_namespace.argocd.metadata[0].name}.svc.cluster.local"
}

output "argocd_admin_username" {
  value = "admin" 
}