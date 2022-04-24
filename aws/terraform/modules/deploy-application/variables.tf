

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

variable "host" {
  type        = string
  description = "Host address of the service"
  default     = ""
}

variable "port" {
  type        = number
  description = "Port of the service"
  default     = 80
}

variable "health_check_timeout" {
  type        = number
  description = "Timeout value in seconds, for health check."
  default     = 120
}

variable "health_check_enabled" {
  type        = bool
  description = "If true checks if the host:port is open."
  default     = false
}

variable "cname" {
  type        = string
  description = "Domain name of the service"
  default     = ""
}

variable "deployment_type" {
  type        = string
  description = "Deployment type"
  default    = "deployment"
}