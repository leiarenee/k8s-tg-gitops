resource "kubernetes_mutating_webhook_configuration" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.mutating_webhook_configuration.applications

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

    }
  }

  dynamic "webhook" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "webhooks", {})

    content {
      admission_review_versions = lookup(webhook.value, "admissionReviewVersions", null)
      # Type: ['list', 'string']   Optional  

      failure_policy = lookup(webhook.value, "failurePolicy", null)
      # Type: string   Optional  

      match_policy = lookup(webhook.value, "matchPolicy", null)
      # Type: string   Optional  

      name = lookup(webhook.value, "name", null)
      # Type: string Required    

      reinvocation_policy = lookup(webhook.value, "reinvocationPolicy", null)
      # Type: string   Optional  

      side_effects = lookup(webhook.value, "sideEffects", null)
      # Type: string   Optional  

      timeout_seconds = lookup(webhook.value, "timeoutSeconds", null)
      # Type: number   Optional  

      dynamic "client_config" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(webhook.value), "clientConfig") ? {item = webhook.value["clientConfig"]} : {}

        content {
          ca_bundle = lookup(client_config.value, "caBundle", null)
          # Type: string   Optional  

          url = lookup(client_config.value, "url", null)
          # Type: string   Optional  

          dynamic "service" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(client_config.value), "service") ? {item = client_config.value["service"]} : {}

            content {
              name = lookup(service.value, "name", null)
              # Type: string Required    

              namespace = var.namespace != "" ? var.namespace : lookup(service.value, "namespace", null)
              # Type: string Required    

              path = lookup(service.value, "path", null)
              # Type: string   Optional  

              port = lookup(service.value, "port", null)
              # Type: number   Optional  

            }
          }

        }
      }

      dynamic "namespace_selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(webhook.value), "namespaceSelector") ? {item = webhook.value["namespaceSelector"]} : {}

        content {
          match_labels = lookup(namespace_selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(namespace_selector.value, "matchExpressions", {})

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

      dynamic "object_selector" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(webhook.value), "objectSelector") ? {item = webhook.value["objectSelector"]} : {}

        content {
          match_labels = lookup(object_selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(object_selector.value, "matchExpressions", {})

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

      dynamic "rule" { # Nesting Mode: list  
        for_each = lookup(webhook.value, "rules", {})

        content {
          api_groups = lookup(rule.value, "apiGroups", null)
          # Type: ['list', 'string'] Required    

          api_versions = lookup(rule.value, "apiVersions", null)
          # Type: ['list', 'string'] Required    

          operations = lookup(rule.value, "operations", null)
          # Type: ['list', 'string'] Required    

          resources = lookup(rule.value, "resources", null)
          # Type: ['list', 'string'] Required    

          scope = lookup(rule.value, "scope", null)
          # Type: string   Optional  

        }
      }

    }
  }


}