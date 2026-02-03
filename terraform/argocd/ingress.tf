resource "kubernetes_ingress_v1" "argocd_server" {
  metadata {
    name      = "argocd-server-ingress"
    namespace = kubernetes_namespace.argocd.metadata[0].name

    annotations = {
      # Ingress class
      "kubernetes.io/ingress.class" = "nginx"

      # HTTP configuration (no SSL redirect)
      "nginx.ingress.kubernetes.io/ssl-redirect"       = "false"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "false"
      "nginx.ingress.kubernetes.io/backend-protocol"   = "HTTP"

      # Performance optimizations
      "nginx.ingress.kubernetes.io/proxy-body-size"       = "100m"
      "nginx.ingress.kubernetes.io/proxy-connect-timeout" = "600"
      "nginx.ingress.kubernetes.io/proxy-send-timeout"    = "600"
      "nginx.ingress.kubernetes.io/proxy-read-timeout"    = "600"
      "nginx.ingress.kubernetes.io/proxy-buffer-size"     = "16k"

      # Security
      "nginx.ingress.kubernetes.io/limit-rps"         = "100"
      "nginx.ingress.kubernetes.io/limit-connections" = "10"

      # Compression
      "nginx.ingress.kubernetes.io/enable-compression" = "true"

      # WebSocket support (for ArgoCD real-time updates)
      "nginx.ingress.kubernetes.io/websocket-services" = "argocd-server"
    }

    labels = {
      app        = "argocd"
      component  = "server"
      managed-by = "terraform"
    }
  }

  spec {
    ingress_class_name = "nginx"

    rule {
      host = var.argocd_domain

      http {
        path {
          path      = "/"
          path_type = "Prefix"

          backend {
            service {
              name = "argocd-server"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [helm_release.argocd]
}