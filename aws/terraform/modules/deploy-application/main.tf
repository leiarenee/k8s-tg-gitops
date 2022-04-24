locals {
  module_output = module.deploy._output_data
  deployment_output = local.module_output["${var.application_name}:folders.${var.source_folder}:${var.source_folder}/${var.deployment_type}.yml:00"]
}

module "deploy" {
  source = "./deploy-yaml"
  cluster_id = var.cluster_id
  namespace = var.namespace
  application_name = var.application_name
  source_folder = var.source_folder

}

resource "null_resource" "health_check" {
  count = var.health_check_enabled ? 1 : 0
  triggers = {
    value = timestamp()
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = "scripts/health-check.sh ${var.host} ${var.port} ${var.health_check_timeout}"
  }
}