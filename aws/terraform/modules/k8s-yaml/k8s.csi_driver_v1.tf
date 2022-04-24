resource "kubernetes_csi_driver_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.csi_driver_v1.applications

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

  dynamic "spec" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      attach_required = lookup(spec.value, "attachRequired", null)
      # Type: bool Required    

      pod_info_on_mount = lookup(spec.value, "podInfoOnMount", null)
      # Type: bool   Optional  

      volume_lifecycle_modes = lookup(spec.value, "volumeLifecycleModes", null)
      # Type: ['list', 'string']   Optional  

    }
  }


}