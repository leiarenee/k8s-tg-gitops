resource "kubernetes_manifest" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.manifest.applications

  computed_fields = lookup(each.value, "computedFields", null)
  # Type: ['list', 'string']   Optional  

  manifest = lookup(each.value, "manifest", null)
  # Type: dynamic Required    

  object = lookup(each.value, "object", null)
  # Type: dynamic   Optional Computed 

  wait_for = lookup(each.value, "waitFor", null)
  # Type: ['object', {'fields': ['map', 'string']}]   Optional  

  dynamic "field_manager" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "fieldManager") ? {item = each.value["fieldManager"]} : {}

    content {
      force_conflicts = lookup(field_manager.value, "forceConflicts", null)
      # Type: bool   Optional  

      name = lookup(field_manager.value, "name", null)
      # Type: string   Optional  

    }
  }

  dynamic "timeouts" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      create = lookup(timeouts.value, "create", null)
      # Type: string   Optional  

      delete = lookup(timeouts.value, "delete", null)
      # Type: string   Optional  

      update = lookup(timeouts.value, "update", null)
      # Type: string   Optional  

    }
  }

  dynamic "wait" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "wait") ? {item = each.value["wait"]} : {}

    content {
      fields = lookup(wait.value, "fields", null)
      # Type: ['map', 'string']   Optional  

      rollout = lookup(wait.value, "rollout", null)
      # Type: bool   Optional  

    }
  }


}