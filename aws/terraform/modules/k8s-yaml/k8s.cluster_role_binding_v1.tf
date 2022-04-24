resource "kubernetes_cluster_role_binding_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.cluster_role_binding_v1.applications

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional Computed 

    }
  }

  dynamic "role_ref" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "roleRef") ? {item = each.value["roleRef"]} : {}

    content {
      api_group = lookup(role_ref.value, "apiGroup", null)
      # Type: string Required    

      kind = lookup(role_ref.value, "kind", null)
      # Type: string Required    

      name = lookup(role_ref.value, "name", null)
      # Type: string Required    

    }
  }

  dynamic "subject" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "subjects", {})

    content {
      api_group = lookup(subject.value, "apiGroup", null)
      # Type: string   Optional Computed 

      kind = lookup(subject.value, "kind", null)
      # Type: string Required    

      name = lookup(subject.value, "name", null)
      # Type: string Required    

      namespace = var.namespace != "" ? var.namespace : lookup(subject.value, "namespace", null)
      # Type: string   Optional  

    }
  }


}