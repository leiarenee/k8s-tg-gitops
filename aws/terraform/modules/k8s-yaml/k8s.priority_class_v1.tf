resource "kubernetes_priority_class_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.priority_class_v1.applications

  description = lookup(each.value, "description", null)
  # Type: string   Optional  

  global_default = lookup(each.value, "globalDefault", null)
  # Type: bool   Optional  

  value = lookup(each.value, "value", null)
  # Type: number Required    

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


}