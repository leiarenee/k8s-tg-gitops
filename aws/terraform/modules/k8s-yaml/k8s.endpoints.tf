resource "kubernetes_endpoints" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.endpoints.applications

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

  dynamic "subset" { # Nesting Mode: set  
    for_each = contains(keys(each.value), "subset") ? {item = each.value["subset"]} : {}

    content {
      dynamic "address" { # Nesting Mode: set  
        for_each = contains(keys(subset.value), "address") ? {item = subset.value["address"]} : {}

        content {
          hostname = lookup(address.value, "hostname", null)
          # Type: string   Optional  

          ip = lookup(address.value, "ip", null)
          # Type: string Required    

          node_name = lookup(address.value, "nodeName", null)
          # Type: string   Optional  

        }
      }

      dynamic "not_ready_address" { # Nesting Mode: set  
        for_each = contains(keys(subset.value), "notReadyAddress") ? {item = subset.value["notReadyAddress"]} : {}

        content {
          hostname = lookup(not_ready_address.value, "hostname", null)
          # Type: string   Optional  

          ip = lookup(not_ready_address.value, "ip", null)
          # Type: string Required    

          node_name = lookup(not_ready_address.value, "nodeName", null)
          # Type: string   Optional  

        }
      }

      dynamic "port" { # Nesting Mode: set  
        for_each = contains(keys(subset.value), "port") ? {item = subset.value["port"]} : {}

        content {
          name = lookup(port.value, "name", null)
          # Type: string   Optional  

          port = lookup(port.value, "port", null)
          # Type: number Required    

          protocol = lookup(port.value, "protocol", null)
          # Type: string   Optional  

        }
      }

    }
  }


}