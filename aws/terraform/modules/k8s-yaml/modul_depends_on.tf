variable "module_depends_on" {
  default = []
}

variable "module_enabled" {
  type = bool
  default = true
}

resource "null_resource" "module_depends_on" {
  count = var.module_enabled ? 1 : 0
  triggers = {
    value = join("," , var.module_depends_on)
  }
}

