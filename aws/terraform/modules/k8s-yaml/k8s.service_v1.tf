resource "kubernetes_service_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.service_v1.applications

  wait_for_load_balancer = lookup(each.value, "waitForLoadBalancer", null)
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

      namespace = var.namespace != "" ? var.namespace : lookup(metadata.value, "namespace", null)
      # Type: string   Optional  

    }
  }

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      cluster_ip = lookup(spec.value, "clusterIP", null)
      # Type: string   Optional Computed 

      external_ips = lookup(spec.value, "externalIPs", null)
      # Type: ['set', 'string']   Optional  

      external_name = lookup(spec.value, "externalName", null)
      # Type: string   Optional  

      external_traffic_policy = lookup(spec.value, "externalTrafficPolicy", null)
      # Type: string   Optional Computed 

      health_check_node_port = lookup(spec.value, "healthCheckNodePort", null)
      # Type: number   Optional Computed 

      load_balancer_ip = lookup(spec.value, "loadBalancerIP", null)
      # Type: string   Optional  

      load_balancer_source_ranges = lookup(spec.value, "loadBalancerSourceRanges", null)
      # Type: ['set', 'string']   Optional  

      publish_not_ready_addresses = lookup(spec.value, "publishNotReadyAddresses", null)
      # Type: bool   Optional  

      selector = lookup(spec.value, "selector", null)
      # Type: ['map', 'string']   Optional  

      session_affinity = lookup(spec.value, "sessionAffinity", null)
      # Type: string   Optional  

      type = lookup(spec.value, "type", null)
      # Type: string   Optional  

      dynamic "port" { # Nesting Mode: list  
        for_each = lookup(spec.value, "ports", {})

        content {
          app_protocol = lookup(port.value, "appProtocol", null)
          # Type: string   Optional  

          name = lookup(port.value, "name", null)
          # Type: string   Optional  

          node_port = lookup(port.value, "nodePort", null)
          # Type: number   Optional Computed 

          port = lookup(port.value, "port", null)
          # Type: number Required    

          protocol = lookup(port.value, "protocol", null)
          # Type: string   Optional  

          target_port = lookup(port.value, "targetPort", null)
          # Type: string   Optional Computed 

        }
      }

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