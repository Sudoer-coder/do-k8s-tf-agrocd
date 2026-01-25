
variable "region" {
  type = string
}

variable "project_id" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "nodepool_size" {
  type = string
}

variable "nodepool_min_nodes" {
  type = number
}

variable "nodepool_max_nodes" {
  type = number
}

variable "environment" {
  type = string
}
