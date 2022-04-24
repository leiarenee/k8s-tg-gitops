resource "kubernetes_horizontal_pod_autoscaler_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.horizontal_pod_autoscaler_v1.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  

      generate_name = lookup(metadata.value, "generateName", null)
      # Type: string   Optional  

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      max_replicas = lookup(spec.value, "maxReplicas", null)
      # Type: number Required    

      min_replicas = lookup(spec.value, "minReplicas", null)
      # Type: number   Optional  

      target_cpu_utilization_percentage = lookup(spec.value, "targetCpuUtilizationPercentage", null)
      # Type: number   Optional Computed 

      dynamic "scale_target_ref" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "scaleTargetRef") ? {item = spec.value["scaleTargetRef"]} : {}

        content {
          api_version = lookup(scale_target_ref.value, "apiVersion", null)
          # Type: string   Optional  

          kind = lookup(scale_target_ref.value, "kind", null)
          # Type: string Required    

          name = lookup(scale_target_ref.value, "name", null)
          # Type: string Required    

        }
      }

    }
  }


}