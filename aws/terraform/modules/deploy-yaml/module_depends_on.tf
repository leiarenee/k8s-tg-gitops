variable "module_depends_on" {
  default = []
}

variable "module_enabled" {
  description = "Enable/disable module"
  type        = bool
  default     = true
}

resource "null_resource" "module_depends_on" {
  count = (length(var.module_depends_on) > 0 && var.module_enabled) ? 1 : 0
  triggers = {
    value = length(var.module_depends_on)
  }
}