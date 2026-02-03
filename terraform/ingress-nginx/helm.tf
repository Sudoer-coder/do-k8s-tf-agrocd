resource "helm_release" "nginx_ingress" {
  name             = "nginx-ingress"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = kubernetes_namespace.ingress.metadata[0].name
  create_namespace = true
  version          = "4.9.1" # specify version or omit for latest

  # Common configuration values
  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }

  # Optional: Custom values file
  # values = [
  #   file("${path.module}/nginx-ingress-values.yaml")
  # ]
}
