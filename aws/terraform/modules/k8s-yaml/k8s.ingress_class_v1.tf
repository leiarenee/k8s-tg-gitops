resource "kubernetes_ingress_class_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.ingress_class_v1.applications

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
      controller = lookup(spec.value, "controller", null)
      # Type: string   Optional  

      dynamic "parameters" { # Nesting Mode: list  
        for_each = lookup(spec.value, "parameters", {})

        content {
          api_group = lookup(parameters.value, "apiGroup", null)
          # Type: string   Optional  

          kind = lookup(parameters.value, "kind", null)
          # Type: string Required    

          name = lookup(parameters.value, "name", null)
          # Type: string Required    

          namespace = var.namespace != "" ? var.namespace : lookup(parameters.value, "namespace", null)
          # Type: string   Optional  

          scope = lookup(parameters.value, "scope", null)
          # Type: string   Optional Computed 

        }
      }

    }
  }


}