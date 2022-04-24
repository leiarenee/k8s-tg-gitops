resource "kubernetes_certificate_signing_request" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.certificate_signing_request.applications

  auto_approve = lookup(each.value, "autoApprove", null)
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

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      request = lookup(spec.value, "request", null)
      # Type: string Required    

      signer_name = lookup(spec.value, "signerName", null)
      # Type: string   Optional  

      usages = lookup(spec.value, "usages", null)
      # Type: ['set', 'string']   Optional  

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