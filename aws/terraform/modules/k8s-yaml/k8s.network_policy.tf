resource "kubernetes_network_policy" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.network_policy.applications

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
      policy_types = lookup(spec.value, "policyTypes", null)
      # Type: ['list', 'string'] Required    

      dynamic "egress" { # Nesting Mode: list  
        for_each = lookup(spec.value, "egress", {})

        content {
          dynamic "ports" { # Nesting Mode: list  
            for_each = lookup(egress.value, "ports", {})

            content {
              port = lookup(ports.value, "port", null)
              # Type: string   Optional  

              protocol = lookup(ports.value, "protocol", null)
              # Type: string   Optional  

            }
          }

          dynamic "to" { # Nesting Mode: list  
            for_each = lookup(egress.value, "to", {})

            content {
              dynamic "ip_block" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(to.value), "ipBlock") ? {item = to.value["ipBlock"]} : {}

                content {
                  cidr = lookup(ip_block.value, "cidr", null)
                  # Type: string   Optional  

                  except = lookup(ip_block.value, "except", null)
                  # Type: ['list', 'string']   Optional  

                }
              }

              dynamic "namespace_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(to.value), "namespaceSelector") ? {item = to.value["namespaceSelector"]} : {}

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

              dynamic "pod_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(to.value), "podSelector") ? {item = to.value["podSelector"]} : {}

                content {
                  match_labels = lookup(pod_selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(pod_selector.value, "matchExpressions", {})

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
      }

      dynamic "ingress" { # Nesting Mode: list  
        for_each = lookup(spec.value, "ingress", {})

        content {
          dynamic "from" { # Nesting Mode: list  
            for_each = lookup(ingress.value, "from", {})

            content {
              dynamic "ip_block" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(from.value), "ipBlock") ? {item = from.value["ipBlock"]} : {}

                content {
                  cidr = lookup(ip_block.value, "cidr", null)
                  # Type: string   Optional  

                  except = lookup(ip_block.value, "except", null)
                  # Type: ['list', 'string']   Optional  

                }
              }

              dynamic "namespace_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(from.value), "namespaceSelector") ? {item = from.value["namespaceSelector"]} : {}

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

              dynamic "pod_selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(from.value), "podSelector") ? {item = from.value["podSelector"]} : {}

                content {
                  match_labels = lookup(pod_selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(pod_selector.value, "matchExpressions", {})

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

          dynamic "ports" { # Nesting Mode: list  
            for_each = lookup(ingress.value, "ports", {})

            content {
              port = lookup(ports.value, "port", null)
              # Type: string   Optional  

              protocol = lookup(ports.value, "protocol", null)
              # Type: string   Optional  

            }
          }

        }
      }

      dynamic "pod_selector" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "podSelector") ? {item = spec.value["podSelector"]} : {}

        content {
          match_labels = lookup(pod_selector.value, "matchLabels", null)
          # Type: ['map', 'string']   Optional  

          dynamic "match_expressions" { # Nesting Mode: list  
            for_each = lookup(pod_selector.value, "matchExpressions", {})

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