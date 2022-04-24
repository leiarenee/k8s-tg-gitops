resource "kubernetes_pod_security_policy" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.pod_security_policy.applications

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

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
    for_each = contains(keys(each.value), "spec") ? {item = each.value["spec"]} : {}

    content {
      allow_privilege_escalation = lookup(spec.value, "allowPrivilegeEscalation", null)
      # Type: bool   Optional Computed 

      allowed_capabilities = lookup(spec.value, "allowedCapabilities", null)
      # Type: ['list', 'string']   Optional Computed 

      allowed_proc_mount_types = lookup(spec.value, "allowedProcMountTypes", null)
      # Type: ['list', 'string']   Optional  

      allowed_unsafe_sysctls = lookup(spec.value, "allowedUnsafeSysctls", null)
      # Type: ['list', 'string']   Optional  

      default_add_capabilities = lookup(spec.value, "defaultAddCapabilities", null)
      # Type: ['list', 'string']   Optional  

      default_allow_privilege_escalation = lookup(spec.value, "defaultAllowPrivilegeEscalation", null)
      # Type: bool   Optional Computed 

      forbidden_sysctls = lookup(spec.value, "forbiddenSysctls", null)
      # Type: ['list', 'string']   Optional  

      host_ipc = lookup(spec.value, "hostIPC", null)
      # Type: bool   Optional Computed 

      host_network = lookup(spec.value, "hostNetwork", null)
      # Type: bool   Optional Computed 

      host_pid = lookup(spec.value, "hostPid", null)
      # Type: bool   Optional Computed 

      privileged = lookup(spec.value, "privileged", null)
      # Type: bool   Optional Computed 

      read_only_root_filesystem = lookup(spec.value, "readOnlyRootFilesystem", null)
      # Type: bool   Optional Computed 

      required_drop_capabilities = lookup(spec.value, "requiredDropCapabilities", null)
      # Type: ['list', 'string']   Optional Computed 

      volumes = lookup(spec.value, "volumes", null)
      # Type: ['list', 'string']   Optional Computed 

      dynamic "allowed_flex_volumes" { # Nesting Mode: list  
        for_each = lookup(spec.value, "allowedFlexVolumes", {})

        content {
          driver = lookup(allowed_flex_volumes.value, "driver", null)
          # Type: string Required    

        }
      }

      dynamic "allowed_host_paths" { # Nesting Mode: list  
        for_each = lookup(spec.value, "allowedHostPaths", {})

        content {
          path_prefix = lookup(allowed_host_paths.value, "pathPrefix", null)
          # Type: string Required    

          read_only = lookup(allowed_host_paths.value, "readOnly", null)
          # Type: bool   Optional  

        }
      }

      dynamic "fs_group" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "fsGroup") ? {item = spec.value["fsGroup"]} : {}

        content {
          rule = lookup(fs_group.value, "rule", null)
          # Type: string Required    

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(fs_group.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    

              min = lookup(range.value, "min", null)
              # Type: number Required    

            }
          }

        }
      }

      dynamic "host_ports" { # Nesting Mode: list  
        for_each = lookup(spec.value, "hostPorts", {})

        content {
          max = lookup(host_ports.value, "max", null)
          # Type: number Required    

          min = lookup(host_ports.value, "min", null)
          # Type: number Required    

        }
      }

      dynamic "run_as_group" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "runAsGroup") ? {item = spec.value["runAsGroup"]} : {}

        content {
          rule = lookup(run_as_group.value, "rule", null)
          # Type: string Required    

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(run_as_group.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    

              min = lookup(range.value, "min", null)
              # Type: number Required    

            }
          }

        }
      }

      dynamic "run_as_user" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "runAsUser") ? {item = spec.value["runAsUser"]} : {}

        content {
          rule = lookup(run_as_user.value, "rule", null)
          # Type: string Required    

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(run_as_user.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    

              min = lookup(range.value, "min", null)
              # Type: number Required    

            }
          }

        }
      }

      dynamic "se_linux" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "seLinux") ? {item = spec.value["seLinux"]} : {}

        content {
          rule = lookup(se_linux.value, "rule", null)
          # Type: string Required    

          dynamic "se_linux_options" { # Nesting Mode: list  
            for_each = lookup(se_linux.value, "seLinuxOptions", {})

            content {
              level = lookup(se_linux_options.value, "level", null)
              # Type: string Required    

              role = lookup(se_linux_options.value, "role", null)
              # Type: string Required    

              type = lookup(se_linux_options.value, "type", null)
              # Type: string Required    

              user = lookup(se_linux_options.value, "user", null)
              # Type: string Required    

            }
          }

        }
      }

      dynamic "supplemental_groups" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "supplementalGroups") ? {item = spec.value["supplementalGroups"]} : {}

        content {
          rule = lookup(supplemental_groups.value, "rule", null)
          # Type: string Required    

          dynamic "range" { # Nesting Mode: list  
            for_each = lookup(supplemental_groups.value, "range", {})

            content {
              max = lookup(range.value, "max", null)
              # Type: number Required    

              min = lookup(range.value, "min", null)
              # Type: number Required    

            }
          }

        }
      }

    }
  }


}