variable "argocd_domain" {
  description = "Domain name for ArgoCD server (e.g., argocd.example.com)"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?(\\.[a-z0-9]([a-z0-9-]{0,61}[a-z0-9])?)*$", var.argocd_domain))
    error_message = "The argocd_domain must be a valid DNS name."
  }
}