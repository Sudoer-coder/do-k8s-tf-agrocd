resource "digitalocean_vpc" "prod_vpc" {
  name     = "prod-vpc"
  region   = var.region
  ip_range = var.vpc_cidr
}
