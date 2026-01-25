terraform {
  cloud {
    organization = "your-org-name"

    workspaces {
      name = "doks-prod"
    }
  }
}
