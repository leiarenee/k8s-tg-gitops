resource "kubernetes_horizontal_pod_autoscaler" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.horizontal_pod_autoscaler.applications

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

      dynamic "behavior" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "behavior") ? {item = spec.value["behavior"]} : {}

        content {
          dynamic "scale_down" { # Nesting Mode: list  
            for_each = lookup(behavior.value, "scaleDown", {})

            content {
              select_policy = lookup(scale_down.value, "selectPolicy", null)
              # Type: string   Optional  

              stabilization_window_seconds = lookup(scale_down.value, "stabilizationWindowSeconds", null)
              # Type: number   Optional  

              dynamic "policy" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(scale_down.value, "policy", {})

                content {
                  period_seconds = lookup(policy.value, "periodSeconds", null)
                  # Type: number Required    

                  type = lookup(policy.value, "type", null)
                  # Type: string Required    

                  value = lookup(policy.value, "value", null)
                  # Type: number Required    

                }
              }

            }
          }

          dynamic "scale_up" { # Nesting Mode: list  
            for_each = lookup(behavior.value, "scaleUp", {})

            content {
              select_policy = lookup(scale_up.value, "selectPolicy", null)
              # Type: string   Optional  

              stabilization_window_seconds = lookup(scale_up.value, "stabilizationWindowSeconds", null)
              # Type: number   Optional  

              dynamic "policy" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(scale_up.value, "policy", {})

                content {
                  period_seconds = lookup(policy.value, "periodSeconds", null)
                  # Type: number Required    

                  type = lookup(policy.value, "type", null)
                  # Type: string Required    

                  value = lookup(policy.value, "value", null)
                  # Type: number Required    

                }
              }

            }
          }

        }
      }

      dynamic "metric" { # Nesting Mode: list  
        for_each = lookup(spec.value, "metrics", {})

        content {
          type = lookup(metric.value, "type", null)
          # Type: string Required    

          dynamic "container_resource" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "containerResource") ? {item = metric.value["containerResource"]} : {}

            content {
              container = lookup(container_resource.value, "container", null)
              # Type: string Required    

              name = lookup(container_resource.value, "name", null)
              # Type: string Required    

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(container_resource.value), "target") ? {item = container_resource.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  

                  type = lookup(target.value, "type", null)
                  # Type: string Required    

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  

                }
              }

            }
          }

          dynamic "external" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "external") ? {item = metric.value["external"]} : {}

            content {
              dynamic "metric" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(external.value), "metric") ? {item = external.value["metric"]} : {}

                content {
                  name = lookup(metric.value, "name", null)
                  # Type: string Required    

                  dynamic "selector" { # Nesting Mode: list  
                    for_each = lookup(metric.value, "selector", {})

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

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(external.value), "target") ? {item = external.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  

                  type = lookup(target.value, "type", null)
                  # Type: string Required    

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  

                }
              }

            }
          }

          dynamic "object" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "object") ? {item = metric.value["object"]} : {}

            content {
              dynamic "described_object" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(object.value), "describedObject") ? {item = object.value["describedObject"]} : {}

                content {
                  api_version = lookup(described_object.value, "apiVersion", null)
                  # Type: string Required    

                  kind = lookup(described_object.value, "kind", null)
                  # Type: string Required    

                  name = lookup(described_object.value, "name", null)
                  # Type: string Required    

                }
              }

              dynamic "metric" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(object.value), "metric") ? {item = object.value["metric"]} : {}

                content {
                  name = lookup(metric.value, "name", null)
                  # Type: string Required    

                  dynamic "selector" { # Nesting Mode: list  
                    for_each = lookup(metric.value, "selector", {})

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

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(object.value), "target") ? {item = object.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  

                  type = lookup(target.value, "type", null)
                  # Type: string Required    

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  

                }
              }

            }
          }

          dynamic "pods" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "pods") ? {item = metric.value["pods"]} : {}

            content {
              dynamic "metric" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(pods.value), "metric") ? {item = pods.value["metric"]} : {}

                content {
                  name = lookup(metric.value, "name", null)
                  # Type: string Required    

                  dynamic "selector" { # Nesting Mode: list  
                    for_each = lookup(metric.value, "selector", {})

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

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(pods.value), "target") ? {item = pods.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  

                  type = lookup(target.value, "type", null)
                  # Type: string Required    

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  

                }
              }

            }
          }

          dynamic "resource" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(metric.value), "resource") ? {item = metric.value["resource"]} : {}

            content {
              name = lookup(resource.value, "name", null)
              # Type: string Required    

              dynamic "target" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(resource.value), "target") ? {item = resource.value["target"]} : {}

                content {
                  average_utilization = lookup(target.value, "averageUtilization", null)
                  # Type: number   Optional  

                  average_value = lookup(target.value, "averageValue", null)
                  # Type: string   Optional  

                  type = lookup(target.value, "type", null)
                  # Type: string Required    

                  value = lookup(target.value, "value", null)
                  # Type: string   Optional  

                }
              }

            }
          }

        }
      }

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