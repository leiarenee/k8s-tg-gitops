resource "kubernetes_namespace_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.namespace_v1.applications

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

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      delete = lookup(timeouts.value, "delete", null)
      # Type: string   Optional  

    }
  }


}