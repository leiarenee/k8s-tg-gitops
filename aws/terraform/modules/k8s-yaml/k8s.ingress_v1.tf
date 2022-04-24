resource "kubernetes_ingress_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.ingress_v1.applications

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

      dynamic "default_backend" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "defaultBackend") ? {item = spec.value["defaultBackend"]} : {}

        content {
          dynamic "resource" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(default_backend.value), "resource") ? {item = default_backend.value["resource"]} : {}

            content {
              api_group = lookup(resource.value, "apiGroup", null)
              # Type: string Required    

              kind = lookup(resource.value, "kind", null)
              # Type: string Required    

              name = lookup(resource.value, "name", null)
              # Type: string Required    

            }
          }

          dynamic "service" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(default_backend.value), "service") ? {item = default_backend.value["service"]} : {}

            content {
              name = lookup(service.value, "name", null)
              # Type: string Required    

              dynamic "port" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(service.value), "port") ? {item = service.value["port"]} : {}

                content {
                  name = lookup(port.value, "name", null)
                  # Type: string   Optional  

                  number = lookup(port.value, "number", null)
                  # Type: number   Optional  

                }
              }

            }
          }

        }
      }

      dynamic "rule" { # Nesting Mode: list  
        for_each = lookup(spec.value, "rules", {})

        content {
          host = lookup(rule.value, "host", null)
          # Type: string   Optional  

          dynamic "http" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(rule.value), "http") ? {item = rule.value["http"]} : {}

            content {
              dynamic "path" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(http.value, "paths", {})

                content {
                  path = lookup(path.value, "path", null)
                  # Type: string   Optional  

                  path_type = lookup(path.value, "pathType", null)
                  # Type: string   Optional  

                  dynamic "backend" { # Nesting Mode: list  Max Items : 1  
                    for_each = contains(keys(path.value), "backend") ? {item = path.value["backend"]} : {}

                    content {
                      dynamic "resource" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(backend.value), "resource") ? {item = backend.value["resource"]} : {}

                        content {
                          api_group = lookup(resource.value, "apiGroup", null)
                          # Type: string Required    

                          kind = lookup(resource.value, "kind", null)
                          # Type: string Required    

                          name = lookup(resource.value, "name", null)
                          # Type: string Required    

                        }
                      }

                      dynamic "service" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(backend.value), "service") ? {item = backend.value["service"]} : {}

                        content {
                          name = lookup(service.value, "name", null)
                          # Type: string Required    

                          dynamic "port" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                            for_each = contains(keys(service.value), "port") ? {item = service.value["port"]} : {}

                            content {
                              name = lookup(port.value, "name", null)
                              # Type: string   Optional  

                              number = lookup(port.value, "number", null)
                              # Type: number   Optional  

                            }
                          }

                        }
                      }

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