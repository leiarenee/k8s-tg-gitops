
variable "namespace" {
  type        = string
  default     = ""
}

variable "application_name" {
  type        = string
  default     = "app"
}

variable "source_folder" {
  type        = string
  default     = "src"
}

variable "expose_external" {
  description = "If true service is exposed with a DNS name"
  type = bool
  default = false
}

# CNAME

variable "cname" {
  type        = string
  description = "Domain name of the service"
  default     = ""
}

variable "dns_zone_id" {
  type        = string
  description = "Domain name service zone id"
  default     = ""
}

variable "assign_cname" {
  type        = bool
  description = "If true a cname record id created for loadBalancer ingress address"
  default     = false
}

variable "module_enabled" {
  type        = bool
  description = "If false, disabled resources"
  default     = true
}

