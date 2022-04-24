resource "kubernetes_api_service" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.api_service.applications

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

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      ca_bundle = lookup(spec.value, "caBundle", null)
      # Type: string   Optional  

      group = lookup(spec.value, "group", null)
      # Type: string Required    

      group_priority_minimum = lookup(spec.value, "groupPriorityMinimum", null)
      # Type: number Required    

      insecure_skip_tls_verify = lookup(spec.value, "insecureSkipTlsVerify", null)
      # Type: bool   Optional  

      version = lookup(spec.value, "version", null)
      # Type: string Required    

      version_priority = lookup(spec.value, "versionPriority", null)
      # Type: number Required    

      dynamic "service" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "service") ? {item = spec.value["service"]} : {}

        content {
          name = lookup(service.value, "name", null)
          # Type: string Required    

          namespace = var.namespace != "" ? var.namespace : lookup(service.value, "namespace", null)
          # Type: string Required    

          port = lookup(service.value, "port", null)
          # Type: number   Optional  

        }
      }

    }
  }


}