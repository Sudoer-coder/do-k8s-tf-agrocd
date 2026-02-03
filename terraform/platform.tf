module "ingress_nginx" {
  source = "./ingress-nginx"
}

module "argocd" {
  source = "./argocd"

  argocd_domain = var.argocd_domain

  depends_on = [
    module.ingress_nginx
  ]
}
