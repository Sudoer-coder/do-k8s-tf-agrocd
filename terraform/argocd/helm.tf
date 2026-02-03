resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  version    = "5.51.6" # Pin version for production

  values = [
    templatefile("${path.module}/values.yaml.tpl", {
      argocd_domain = var.argocd_domain
    })
  ]

  # Production settings
  timeout         = 600
  cleanup_on_fail = true
  force_update    = false
  wait            = true
  wait_for_jobs   = true
  atomic          = true # Rollback on failure

  # Lifecycle
  lifecycle {
    create_before_destroy = true
  }

  depends_on = [kubernetes_namespace.argocd]
}