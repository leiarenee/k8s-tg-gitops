resource "kubernetes_secret" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.secret.applications

  binary_data = lookup(each.value, "binaryData", null)
  # Type: ['map', 'string']   Optional  Sensitive

  data = lookup(each.value, "data", null)
  # Type: ['map', 'string']   Optional Computed Sensitive

  immutable = lookup(each.value, "immutable", null)
  # Type: bool   Optional  

  type = lookup(each.value, "type", null)
  # Type: string   Optional  

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


}