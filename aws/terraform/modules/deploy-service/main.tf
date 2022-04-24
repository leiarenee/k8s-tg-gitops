locals {
  module_output = var.module_enabled ? module.deploy._output_data : null
  service_output = var.module_enabled ? local.module_output["${var.application_name}:folders.${var.source_folder}:${var.source_folder}/service.yml:00"].service : null 
}


module "deploy" {
  source = "./deploy-yaml"
  cluster_id = var.cluster_id
  namespace = var.namespace
  application_name = var.application_name
  source_folder = var.source_folder
  module_enabled = var.module_enabled

}

resource "aws_route53_record" "cname" {
  count   = var.expose_external && var.assign_cname && var.module_enabled ? 1 : 0
  zone_id = var.dns_zone_id
  name    = var.cname
  type    = "CNAME"
  ttl     = "5"

  #records        = [join(",",local.service_output.loadBalancerIngress[*].hostname)]
  records = [local.service_output.status.0.load_balancer.0.ingress.0.hostname]
  
}

