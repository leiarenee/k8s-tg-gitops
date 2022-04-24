output "_output_data" {
  value = {
    for yaml, conf in module.k8s_yaml_tf.output :
      yaml => {
        for key,value in conf :
          key => value
          if value != null
      }
  }
}

output "_appConfig" {
  value = local.appConfig
}

# output "redisClusterIp" {
#   value = module.k8s_yaml_tf.output["apps:folders.deploy-folder:deploy-folder/redis-master/service.yml:00"].service.spec.clusterIp
# }

# output "redisEndPoint" {
#   value = join("", module.k8s_yaml_tf.output["apps:folders.deploy-folder:deploy-folder/redis-master/service.yml:00"].service.loadBalancerIngress[*].hostname)
# }

# output "postgresClusterIp" {
#   value = module.k8s_yaml_tf.output["apps:folders.deploy-folder:deploy-folder/postgres/service.yml:00"].service.spec.clusterIp
# }

# output "postgresEndPoint" {
#   value = join("", module.k8s_yaml_tf.output["apps:folders.deploy-folder:deploy-folder/postgres/service.yml:00"].service.loadBalancerIngress[*].hostname)
# }

# output "mongoClusterIp" {
#   value = module.k8s_yaml_tf.output["apps:folders.deploy-folder:deploy-folder/mongo/service.yml:00"].service.spec.clusterIp
# }

# output "mongoEndPoint" {
#   value = join("", module.k8s_yaml_tf.output["apps:folders.deploy-folder:deploy-folder/mongo/service.yml:00"].service.loadBalancerIngress[*].hostname)
# }