resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"

    labels = {
      name        = "argocd"
      environment = "production"
      managed-by  = "terraform"
    }
  }
}