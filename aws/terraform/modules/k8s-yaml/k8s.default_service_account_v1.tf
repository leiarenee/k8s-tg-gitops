resource "kubernetes_default_service_account_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.default_service_account_v1.applications

  automount_service_account_token = lookup(each.value, "automountServiceAccountToken", null)
  # Type: bool   Optional  

  dynamic "image_pull_secret" { # Nesting Mode: set  
    for_each = contains(keys(each.value), "imagePullSecret") ? {item = each.value["imagePullSecret"]} : {}

    content {
      name = lookup(image_pull_secret.value, "name", null)
      # Type: string   Optional  

    }
  }

  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "metadata") ? {item = each.value["metadata"]} : {}

    content {
      annotations = lookup(metadata.value, "annotations", null)
      # Type: ['map', 'string']   Optional  

      labels = lookup(metadata.value, "labels", null)
      # Type: ['map', 'string']   Optional  

      name = lookup(metadata.value, "name", null)
      # Type: string   Optional  

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  

    }
  }

  dynamic "secret" { # Nesting Mode: set  
    for_each = contains(keys(each.value), "secret") ? {item = each.value["secret"]} : {}

    content {
      name = lookup(secret.value, "name", null)
      # Type: string   Optional  

    }
  }

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      create = lookup(timeouts.value, "create", null)
      # Type: string   Optional  

    }
  }


}