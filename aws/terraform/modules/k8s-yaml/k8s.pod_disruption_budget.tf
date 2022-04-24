resource "kubernetes_pod_disruption_budget" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.pod_disruption_budget.applications

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
      max_unavailable = lookup(spec.value, "maxUnavailable", null)
      # Type: string   Optional  

      min_available = lookup(spec.value, "minAvailable", null)
      # Type: string   Optional  

      dynamic "selector" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
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


}