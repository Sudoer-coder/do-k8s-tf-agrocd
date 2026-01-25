terraform {
  cloud {
    organization = "my-code-space"

    workspaces {
      name = "microservice-doks-tf-ansible"
    }
  }
}
