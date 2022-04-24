variable "cluster_id" {
  description = "Name of the cluster"
  type        = string
}

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
