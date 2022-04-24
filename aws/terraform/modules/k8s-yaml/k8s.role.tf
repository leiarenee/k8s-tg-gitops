resource "kubernetes_role" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.role.applications

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

  dynamic "rule" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "rules", {})

    content {
      api_groups = lookup(rule.value, "apiGroups", null)
      # Type: ['set', 'string'] Required    

      resource_names = lookup(rule.value, "resourceNames", null)
      # Type: ['set', 'string']   Optional  

      resources = lookup(rule.value, "resources", null)
      # Type: ['set', 'string'] Required    

      verbs = lookup(rule.value, "verbs", null)
      # Type: ['set', 'string'] Required    

    }
  }


}