resource "kubernetes_storage_class_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.storage_class_v1.applications

  allow_volume_expansion = lookup(each.value, "allowVolumeExpansion", null)
  # Type: bool   Optional  

  mount_options = lookup(each.value, "mountOptions", null)
  # Type: ['set', 'string']   Optional  

  parameters = lookup(each.value, "parameters", null)
  # Type: ['map', 'string']   Optional  

  reclaim_policy = lookup(each.value, "reclaimPolicy", null)
  # Type: string   Optional  

  storage_provisioner = lookup(each.value, "storageProvisioner", null)
  # Type: string Required    

  volume_binding_mode = lookup(each.value, "volumeBindingMode", null)
  # Type: string   Optional  

  dynamic "allowed_topologies" { # Nesting Mode: list  Max Items : 1  
    for_each = contains(keys(each.value), "allowedTopologies") ? {item = each.value["allowedTopologies"]} : {}

    content {
      dynamic "match_label_expressions" { # Nesting Mode: list  
        for_each = lookup(allowed_topologies.value, "matchLabelExpressions", {})

        content {
          key = lookup(match_label_expressions.value, "key", null)
          # Type: string   Optional  

          values = lookup(match_label_expressions.value, "values", null)
          # Type: ['set', 'string']   Optional  

        }
      }

    }
  }

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