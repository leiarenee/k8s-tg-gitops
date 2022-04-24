resource "kubernetes_cluster_role_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.cluster_role_v1.applications

  dynamic "aggregation_rule" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "aggregationRule") ? {item = each.value["aggregationRule"]} : {}

    content {
      dynamic "cluster_role_selectors" { # Nesting Mode: list  
        for_each = lookup(aggregation_rule.value, "clusterRoleSelectors", {})

        content {
          match_labels = lookup(cluster_role_selectors.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(cluster_role_selectors.value, "matchExpressions", {})

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

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 

    }
  }

  dynamic "rule" { # Nesting Mode: list  
    for_each = lookup(each.value, "rules", {})

    content {
      api_groups = lookup(rule.value, "apiGroups", null)
      # Type: ['list', 'string']   Optional  

      non_resource_urls = lookup(rule.value, "nonResourceUrls", null)
      # Type: ['list', 'string']   Optional  

      resource_names = lookup(rule.value, "resourceNames", null)
      # Type: ['list', 'string']   Optional  

      resources = lookup(rule.value, "resources", null)
      # Type: ['list', 'string']   Optional  

      verbs = lookup(rule.value, "verbs", null)
      # Type: ['list', 'string'] Required    

    }
  }


}