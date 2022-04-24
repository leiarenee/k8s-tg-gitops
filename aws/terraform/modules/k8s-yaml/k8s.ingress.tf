resource "kubernetes_ingress" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.ingress.applications

  wait_for_load_balancer = lookup(each.value, "waitForLoadBalancer", null)
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
      ingress_class_name = lookup(spec.value, "ingressClassName", null)
      # Type: string   Optional  

      dynamic "backend" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "backend") ? {item = spec.value["backend"]} : {}

        content {
          service_name = lookup(backend.value, "serviceName", null)
          # Type: string   Optional  

          service_port = lookup(backend.value, "servicePort", null)
          # Type: string   Optional Computed 

        }
      }

      dynamic "rule" { # Nesting Mode: list  
        for_each = lookup(spec.value, "rules", {})

        content {
          host = lookup(rule.value, "host", null)
          # Type: string   Optional  

          dynamic "http" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
            for_each = contains(keys(rule.value), "http") ? {item = rule.value["http"]} : {}

            content {
              dynamic "path" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(http.value, "paths", {})

                content {
                  path = lookup(path.value, "path", null)
                  # Type: string   Optional  

                  dynamic "backend" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(path.value), "backend") ? {item = path.value["backend"]} : {}

                    content {
                      service_name = lookup(backend.value, "serviceName", null)
                      # Type: string   Optional  

                      service_port = lookup(backend.value, "servicePort", null)
                      # Type: string   Optional Computed 

                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "tls" { # Nesting Mode: list  
        for_each = lookup(spec.value, "tls", {})

        content {
          hosts = lookup(tls.value, "hosts", null)
          # Type: ['list', 'string']   Optional  

          secret_name = lookup(tls.value, "secretName", null)
          # Type: string   Optional  

        }
      }

    }
  }


}