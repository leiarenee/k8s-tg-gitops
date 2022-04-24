resource "kubernetes_annotations" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.annotations.applications

  annotations = lookup(each.value, "annotations", null)
  # Type: ['map', 'string'] Required    

  api_version = lookup(each.value, "apiVersion", null)
  # Type: string Required    

  force = lookup(each.value, "force", null)
  # Type: bool   Optional  

  kind = lookup(each.value, "kind", null)
  # Type: string Required    

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