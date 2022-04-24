resource "kubernetes_persistent_volume_claim" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.persistent_volume_claim.applications

  wait_until_bound = lookup(each.value, "waitUntilBound", null)
  # Type: bool   Optional  

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
      access_modes = lookup(spec.value, "accessModes", null)
      # Type: ['set', 'string'] Required    

      storage_class_name = lookup(spec.value, "storageClassName", null)
      # Type: string   Optional Computed 

      volume_name = lookup(spec.value, "volumeName", null)
      # Type: string   Optional Computed 

      dynamic "resources" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "resources") ? {item = spec.value["resources"]} : {}

        content {
          limits = lookup(resources.value, "limits", null)
          # Type: ['map', 'string']   Optional  

          requests = lookup(resources.value, "requests", null)
          # Type: ['map', 'string']   Optional  

        }
      }

      dynamic "selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "selector") ? {item = spec.value["selector"]} : {}

        content {
          match_labels = lookup(selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(selector.value, "matchExpressions", {})

            content {
              key = lookup(match_expressions.value, "key", null)
              # Type: string   Optional  

              operator = lookup(match_expressions.value, "operator", null)
              # Type: string   Optional  

              values = lookup(match_expressions.value, "values", null)
              # Type: ['set', 'string']   Optional  

            }
          }

        }
      }

    }
  }

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      create = lookup(timeouts.value, "create", null)
      # Type: string   Optional  

    }
  }


}