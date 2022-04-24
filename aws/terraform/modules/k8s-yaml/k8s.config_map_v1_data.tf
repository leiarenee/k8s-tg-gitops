resource "kubernetes_config_map_v1_data" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.config_map_v1_data.applications

  data = lookup(each.value, "data", null)
  # Type: ['map', 'string'] Required    

  force = lookup(each.value, "force", null)
  # Type: bool   Optional  

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      name = lookup(metadata.value, "name", null)
      # Type: string Required    

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  

    }
  }


}