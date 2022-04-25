output "_output_data" {
  value = var.module_enabled ? module.deploy._output_data : null
}

output "_appConfig" {
  value = var.module_enabled ? module.deploy._appConfig : null
}

output "cluster_ip" {
  value = var.module_enabled ? local.service_output.spec.clusterIp : null
}

output "target_port" {
  value = var.module_enabled ? local.service_output.spec_port.targetPort : null
}

output "service_name" {
  value = var.module_enabled ? local.service_output.metadata.name : null
}

output "expose_external" {
  value = var.module_enabled ? ( var.expose_external ? var.expose_external : null ) : null
}

output "loadBalancerIngress" {
  #value = var.module_enabled ? ( var.expose_external ? join(",", local.service_output.loadBalancerIngress[*].hostname) : null) : null
  value = var.module_enabled ? ( var.expose_external ? local.service_output.status.0.load_balancer.0.ingress.0.hostname : null) : null
}

output "cname" {
  value = var.module_enabled ? ( var.expose_external && var.assign_cname ? join("",aws_route53_record.cname[*].name) : null ) : null
}

output "node_port" {
  value = var.module_enabled ? ( var.expose_external ? local.service_output.spec_port.nodePort : null ) : null
}

output "service_host" {
  value = var.module_enabled ? ( var.expose_external ? ( var.assign_cname ? join("",aws_route53_record.cname[*].name) : join(",", local.service_output.loadBalancerIngress[*].hostname) ) : local.service_output.spec.clusterIp ) : null
}
