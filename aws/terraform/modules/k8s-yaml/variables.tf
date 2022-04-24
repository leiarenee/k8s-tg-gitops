variable "appConfig" {
  description = "Deployment Configurations"
  type = any
  default = {}
}

variable "namespace" {
  description = "Namespace to apply"
  type = string
  default = ""
}

variable "ignore_changes" {
  type = any
  default = {}
}