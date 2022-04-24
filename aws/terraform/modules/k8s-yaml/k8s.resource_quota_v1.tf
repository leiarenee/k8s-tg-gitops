resource "kubernetes_resource_quota_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.resource_quota_v1.applications

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
      hard = lookup(spec.value, "hard", null)
      # Type: ['map', 'string']   Optional  

      scopes = lookup(spec.value, "scopes", null)
      # Type: ['set', 'string']   Optional  

      dynamic "scope_selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "scopeSelector") ? {item = spec.value["scopeSelector"]} : {}

        content {
          dynamic "match_expression" { # Nesting Mode: list  
            for_each = lookup(scope_selector.value, "matchExpression", {})

            content {
              operator = lookup(match_expression.value, "operator", null)
              # Type: string Required    

              scope_name = lookup(match_expression.value, "scopeName", null)
              # Type: string Required    

              values = lookup(match_expression.value, "values", null)
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

      update = lookup(timeouts.value, "update", null)
      # Type: string   Optional  

    }
  }


}