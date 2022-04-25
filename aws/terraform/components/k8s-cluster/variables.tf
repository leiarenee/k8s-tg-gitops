variable "cluster_name" {
  description = "Name of the ckuster"
  default = "my-k8s"
  type = string
}

variable "vpc" {
  description = "Vpc parameters"
  type = any
}