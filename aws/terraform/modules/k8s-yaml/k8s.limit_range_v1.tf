resource "kubernetes_limit_range_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.limit_range_v1.applications

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

  dynamic "spec" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      dynamic "limit" { # Nesting Mode: list  
        for_each = lookup(spec.value, "limits", {})

        content {
          default = lookup(limit.value, "default", null)
          # Type: ['map', 'string']   Optional  

          default_request = lookup(limit.value, "defaultRequest", null)
          # Type: ['map', 'string']   Optional Computed 

          max = lookup(limit.value, "max", null)
          # Type: ['map', 'string']   Optional  

          max_limit_request_ratio = lookup(limit.value, "maxLimitRequestRatio", null)
          # Type: ['map', 'string']   Optional  

          min = lookup(limit.value, "min", null)
          # Type: ['map', 'string']   Optional  

          type = lookup(limit.value, "type", null)
          # Type: string   Optional  

        }
      }

    }
  }


}