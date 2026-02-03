resource "helm_release" "nginx_ingress" {
  name      = "ingress-nginx"
  namespace = kubernetes_namespace.ingress.metadata[0].name

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx/ingress-nginx"
  version    = "4.10.1"

  create_namespace = false
  cleanup_on_fail  = true

  values = [
    <<-EOF
controller:
  service:
    type: LoadBalancer
  admissionWebhooks:
    enabled: true
EOF
  ]

  wait    = true
  timeout = 600

  depends_on = [
    kubernetes_namespace.ingress
  ]
}
