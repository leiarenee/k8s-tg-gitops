resource "kubernetes_cron_job_v1" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.cron_job_v1.applications

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
      concurrency_policy = lookup(spec.value, "concurrencyPolicy", null)
      # Type: string   Optional  

      failed_jobs_history_limit = lookup(spec.value, "failedJobsHistoryLimit", null)
      # Type: number   Optional  

      schedule = lookup(spec.value, "schedule", null)
      # Type: string Required    

      starting_deadline_seconds = lookup(spec.value, "startingDeadlineSeconds", null)
      # Type: number   Optional  

      successful_jobs_history_limit = lookup(spec.value, "successfulJobsHistoryLimit", null)
      # Type: number   Optional  

      suspend = lookup(spec.value, "suspend", null)
      # Type: bool   Optional  

      dynamic "job_template" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "jobTemplate") ? {item = spec.value["jobTemplate"]} : {}

        content {
          dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
            for_each = contains(keys(job_template.value), "metadata") ? {item = job_template.value["metadata"]} : {}

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
            for_each = contains(keys(job_template.value), "spec") ? {item = job_template.value["spec"]} : {}

            content {
              active_deadline_seconds = lookup(spec.value, "activeDeadlineSeconds", null)
              # Type: number   Optional  

              backoff_limit = lookup(spec.value, "backoffLimit", null)
              # Type: number   Optional  

              completion_mode = lookup(spec.value, "completionMode", null)
              # Type: string   Optional Computed 

              completions = lookup(spec.value, "completions", null)
              # Type: number   Optional  

              manual_selector = lookup(spec.value, "manualSelector", null)
              # Type: bool   Optional  

              parallelism = lookup(spec.value, "parallelism", null)
              # Type: number   Optional  

              ttl_seconds_after_finished = lookup(spec.value, "ttlSecondsAfterFinished", null)
              # Type: string   Optional  

              dynamic "selector" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(spec.value), "selector") ? {item = spec.value["selector"]} : {}

                content {
                  match_labels = lookup(selector.value, "matchLabels", null)
                  # Type: ['map', 'string']   Optional  

                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(selector.value, "matchExpressions", {})

                    content {
                      key = lookup(match_expressions.value, "key", null)
                      # Type: string   Optional  

                      operator = lookup(match_expressions.value, "operator", null)
                      # Type: string   Optional  

                      values = lookup(match_expressions.value, "values", null)
                      # Type: ['set', 'string']   Optional  

                    }
                  }

                }
              }

              dynamic "template" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                for_each = contains(keys(spec.value), "template") ? {item = spec.value["template"]} : {}

                content {
                  dynamic "metadata" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                    for_each = contains(keys(template.value), "metadata") ? {item = template.value["metadata"]} : {}

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
                    for_each = contains(keys(template.value), "spec") ? {item = template.value["spec"]} : {}

                    content {
                      active_deadline_seconds = lookup(spec.value, "activeDeadlineSeconds", null)
                      # Type: number   Optional  

                      automount_service_account_token = lookup(spec.value, "automountServiceAccountToken", null)
                      # Type: bool   Optional  

                      dns_policy = lookup(spec.value, "dnsPolicy", null)
                      # Type: string   Optional  

                      enable_service_links = lookup(spec.value, "enableServiceLinks", null)
                      # Type: bool   Optional  

                      host_ipc = lookup(spec.value, "hostIPC", null)
                      # Type: bool   Optional  

                      host_network = lookup(spec.value, "hostNetwork", null)
                      # Type: bool   Optional  

                      host_pid = lookup(spec.value, "hostPid", null)
                      # Type: bool   Optional  

                      hostname = lookup(spec.value, "hostname", null)
                      # Type: string   Optional Computed 

                      node_name = lookup(spec.value, "nodeName", null)
                      # Type: string   Optional Computed 

                      node_selector = lookup(spec.value, "nodeSelector", null)
                      # Type: ['map', 'string']   Optional  

                      priority_class_name = lookup(spec.value, "priorityClassName", null)
                      # Type: string   Optional  

                      restart_policy = lookup(spec.value, "restartPolicy", null)
                      # Type: string   Optional  

                      service_account_name = lookup(spec.value, "serviceAccountName", null)
                      # Type: string   Optional Computed 

                      share_process_namespace = lookup(spec.value, "shareProcessNamespace", null)
                      # Type: bool   Optional  

                      subdomain = lookup(spec.value, "subdomain", null)
                      # Type: string   Optional  

                      termination_grace_period_seconds = lookup(spec.value, "terminationGracePeriodSeconds", null)
                      # Type: number   Optional  

                      dynamic "affinity" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(spec.value), "affinity") ? {item = spec.value["affinity"]} : {}

                        content {
                          dynamic "node_affinity" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(affinity.value), "nodeAffinity") ? {item = affinity.value["nodeAffinity"]} : {}

                            content {
                              dynamic "preferred_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                                for_each = lookup(node_affinity.value, "preferredDuringSchedulingIgnoredDuringExecution", {})

                                content {
                                  weight = lookup(preferred_during_scheduling_ignored_during_execution.value, "weight", null)
                                  # Type: number Required    

                                  dynamic "preference" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                                    for_each = contains(keys(preferred_during_scheduling_ignored_during_execution.value), "preference") ? {item = preferred_during_scheduling_ignored_during_execution.value["preference"]} : {}

                                    content {
                                      dynamic "match_expressions" { # Nesting Mode: list  
                                        for_each = lookup(preference.value, "matchExpressions", {})

                                        content {
                                          key = lookup(match_expressions.value, "key", null)
                                          # Type: string   Optional  

                                          operator = lookup(match_expressions.value, "operator", null)
                                          # Type: string   Optional  

                                          values = lookup(match_expressions.value, "values", null)
                                          # Type: ['set', 'string']   Optional  

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                              dynamic "required_during_scheduling_ignored_during_execution" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(node_affinity.value), "requiredDuringSchedulingIgnoredDuringExecution") ? {item = node_affinity.value["requiredDuringSchedulingIgnoredDuringExecution"]} : {}

                                content {
                                  dynamic "node_selector_term" { # Nesting Mode: list  
                                    for_each = lookup(required_during_scheduling_ignored_during_execution.value, "nodeSelectorTerms", {})

                                    content {
                                      dynamic "match_expressions" { # Nesting Mode: list  
                                        for_each = lookup(node_selector_term.value, "matchExpressions", {})

                                        content {
                                          key = lookup(match_expressions.value, "key", null)
                                          # Type: string   Optional  

                                          operator = lookup(match_expressions.value, "operator", null)
                                          # Type: string   Optional  

                                          values = lookup(match_expressions.value, "values", null)
                                          # Type: ['set', 'string']   Optional  

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "pod_affinity" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(affinity.value), "podAffinity") ? {item = affinity.value["podAffinity"]} : {}

                            content {
                              dynamic "preferred_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                                for_each = lookup(pod_affinity.value, "preferredDuringSchedulingIgnoredDuringExecution", {})

                                content {
                                  weight = lookup(preferred_during_scheduling_ignored_during_execution.value, "weight", null)
                                  # Type: number Required    

                                  dynamic "pod_affinity_term" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                                    for_each = contains(keys(preferred_during_scheduling_ignored_during_execution.value), "podAffinityTerm") ? {item = preferred_during_scheduling_ignored_during_execution.value["podAffinityTerm"]} : {}

                                    content {
                                      namespaces = lookup(pod_affinity_term.value, "namespaces", null)
                                      # Type: ['set', 'string']   Optional  

                                      topology_key = lookup(pod_affinity_term.value, "topologyKey", null)
                                      # Type: string   Optional  

                                      dynamic "label_selector" { # Nesting Mode: list  
                                        for_each = contains(keys(pod_affinity_term.value), "labelSelector") ? {item = pod_affinity_term.value["labelSelector"]} : {}

                                        content {
                                          match_labels = lookup(label_selector.value, "matchLabels", null)
                                          # Type: ['map', 'string']   Optional  

                                          dynamic "match_expressions" { # Nesting Mode: list  
                                            for_each = lookup(label_selector.value, "matchExpressions", {})

                                            content {
                                              key = lookup(match_expressions.value, "key", null)
                                              # Type: string   Optional  

                                              operator = lookup(match_expressions.value, "operator", null)
                                              # Type: string   Optional  

                                              values = lookup(match_expressions.value, "values", null)
                                              # Type: ['set', 'string']   Optional  

                                            }
                                          }

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                              dynamic "required_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                                for_each = lookup(pod_affinity.value, "requiredDuringSchedulingIgnoredDuringExecution", {})

                                content {
                                  namespaces = lookup(required_during_scheduling_ignored_during_execution.value, "namespaces", null)
                                  # Type: ['set', 'string']   Optional  

                                  topology_key = lookup(required_during_scheduling_ignored_during_execution.value, "topologyKey", null)
                                  # Type: string   Optional  

                                  dynamic "label_selector" { # Nesting Mode: list  
                                    for_each = contains(keys(required_during_scheduling_ignored_during_execution.value), "labelSelector") ? {item = required_during_scheduling_ignored_during_execution.value["labelSelector"]} : {}

                                    content {
                                      match_labels = lookup(label_selector.value, "matchLabels", null)
                                      # Type: ['map', 'string']   Optional  

                                      dynamic "match_expressions" { # Nesting Mode: list  
                                        for_each = lookup(label_selector.value, "matchExpressions", {})

                                        content {
                                          key = lookup(match_expressions.value, "key", null)
                                          # Type: string   Optional  

                                          operator = lookup(match_expressions.value, "operator", null)
                                          # Type: string   Optional  

                                          values = lookup(match_expressions.value, "values", null)
                                          # Type: ['set', 'string']   Optional  

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "pod_anti_affinity" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(affinity.value), "podAntiAffinity") ? {item = affinity.value["podAntiAffinity"]} : {}

                            content {
                              dynamic "preferred_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                                for_each = lookup(pod_anti_affinity.value, "preferredDuringSchedulingIgnoredDuringExecution", {})

                                content {
                                  weight = lookup(preferred_during_scheduling_ignored_during_execution.value, "weight", null)
                                  # Type: number Required    

                                  dynamic "pod_affinity_term" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                                    for_each = contains(keys(preferred_during_scheduling_ignored_during_execution.value), "podAffinityTerm") ? {item = preferred_during_scheduling_ignored_during_execution.value["podAffinityTerm"]} : {}

                                    content {
                                      namespaces = lookup(pod_affinity_term.value, "namespaces", null)
                                      # Type: ['set', 'string']   Optional  

                                      topology_key = lookup(pod_affinity_term.value, "topologyKey", null)
                                      # Type: string   Optional  

                                      dynamic "label_selector" { # Nesting Mode: list  
                                        for_each = contains(keys(pod_affinity_term.value), "labelSelector") ? {item = pod_affinity_term.value["labelSelector"]} : {}

                                        content {
                                          match_labels = lookup(label_selector.value, "matchLabels", null)
                                          # Type: ['map', 'string']   Optional  

                                          dynamic "match_expressions" { # Nesting Mode: list  
                                            for_each = lookup(label_selector.value, "matchExpressions", {})

                                            content {
                                              key = lookup(match_expressions.value, "key", null)
                                              # Type: string   Optional  

                                              operator = lookup(match_expressions.value, "operator", null)
                                              # Type: string   Optional  

                                              values = lookup(match_expressions.value, "values", null)
                                              # Type: ['set', 'string']   Optional  

                                            }
                                          }

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                              dynamic "required_during_scheduling_ignored_during_execution" { # Nesting Mode: list  
                                for_each = lookup(pod_anti_affinity.value, "requiredDuringSchedulingIgnoredDuringExecution", {})

                                content {
                                  namespaces = lookup(required_during_scheduling_ignored_during_execution.value, "namespaces", null)
                                  # Type: ['set', 'string']   Optional  

                                  topology_key = lookup(required_during_scheduling_ignored_during_execution.value, "topologyKey", null)
                                  # Type: string   Optional  

                                  dynamic "label_selector" { # Nesting Mode: list  
                                    for_each = contains(keys(required_during_scheduling_ignored_during_execution.value), "labelSelector") ? {item = required_during_scheduling_ignored_during_execution.value["labelSelector"]} : {}

                                    content {
                                      match_labels = lookup(label_selector.value, "matchLabels", null)
                                      # Type: ['map', 'string']   Optional  

                                      dynamic "match_expressions" { # Nesting Mode: list  
                                        for_each = lookup(label_selector.value, "matchExpressions", {})

                                        content {
                                          key = lookup(match_expressions.value, "key", null)
                                          # Type: string   Optional  

                                          operator = lookup(match_expressions.value, "operator", null)
                                          # Type: string   Optional  

                                          values = lookup(match_expressions.value, "values", null)
                                          # Type: ['set', 'string']   Optional  

                                        }
                                      }

                                    }
                                  }

                                }
                              }

                            }
                          }

                        }
                      }

                      dynamic "container" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "containers", {})

                        content {
                          args = lookup(container.value, "args", null)
                          # Type: ['list', 'string']   Optional  

                          command = lookup(container.value, "command", null)
                          # Type: ['list', 'string']   Optional  

                          image = lookup(container.value, "image", null)
                          # Type: string   Optional  

                          image_pull_policy = lookup(container.value, "imagePullPolicy", null)
                          # Type: string   Optional Computed 

                          name = lookup(container.value, "name", null)
                          # Type: string Required    

                          stdin = lookup(container.value, "stdin", null)
                          # Type: bool   Optional  

                          stdin_once = lookup(container.value, "stdinOnce", null)
                          # Type: bool   Optional  

                          termination_message_path = lookup(container.value, "terminationMessagePath", null)
                          # Type: string   Optional  

                          termination_message_policy = lookup(container.value, "terminationMessagePolicy", null)
                          # Type: string   Optional Computed 

                          tty = lookup(container.value, "tty", null)
                          # Type: bool   Optional  

                          working_dir = lookup(container.value, "workingDir", null)
                          # Type: string   Optional  

                          dynamic "env" { # Nesting Mode: list  
                            for_each = lookup(container.value, "env", {})

                            content {
                              name = lookup(env.value, "name", null)
                              # Type: string Required    

                              value = lookup(env.value, "value", null)
                              # Type: string   Optional  

                              dynamic "value_from" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(env.value), "valueFrom") ? {item = env.value["valueFrom"]} : {}

                                content {
                                  dynamic "config_map_key_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "configMapKeyRef") ? {item = value_from.value["configMapKeyRef"]} : {}

                                    content {
                                      key = lookup(config_map_key_ref.value, "key", null)
                                      # Type: string   Optional  

                                      name = lookup(config_map_key_ref.value, "name", null)
                                      # Type: string   Optional  

                                      optional = lookup(config_map_key_ref.value, "optional", null)
                                      # Type: bool   Optional  

                                    }
                                  }

                                  dynamic "field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "fieldRef") ? {item = value_from.value["fieldRef"]} : {}

                                    content {
                                      api_version = lookup(field_ref.value, "apiVersion", null)
                                      # Type: string   Optional  

                                      field_path = lookup(field_ref.value, "fieldPath", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                  dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "resourceFieldRef") ? {item = value_from.value["resourceFieldRef"]} : {}

                                    content {
                                      container_name = lookup(resource_field_ref.value, "containerName", null)
                                      # Type: string   Optional  

                                      divisor = lookup(resource_field_ref.value, "divisor", null)
                                      # Type: string   Optional  

                                      resource = lookup(resource_field_ref.value, "resource", null)
                                      # Type: string Required    

                                    }
                                  }

                                  dynamic "secret_key_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "secretKeyRef") ? {item = value_from.value["secretKeyRef"]} : {}

                                    content {
                                      key = lookup(secret_key_ref.value, "key", null)
                                      # Type: string   Optional  

                                      name = lookup(secret_key_ref.value, "name", null)
                                      # Type: string   Optional  

                                      optional = lookup(secret_key_ref.value, "optional", null)
                                      # Type: bool   Optional  

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "env_from" { # Nesting Mode: list  
                            for_each = lookup(container.value, "envFrom", {})

                            content {
                              prefix = lookup(env_from.value, "prefix", null)
                              # Type: string   Optional  

                              dynamic "config_map_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(env_from.value), "configMapRef") ? {item = env_from.value["configMapRef"]} : {}

                                content {
                                  name = lookup(config_map_ref.value, "name", null)
                                  # Type: string Required    

                                  optional = lookup(config_map_ref.value, "optional", null)
                                  # Type: bool   Optional  

                                }
                              }

                              dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(env_from.value), "secretRef") ? {item = env_from.value["secretRef"]} : {}

                                content {
                                  name = lookup(secret_ref.value, "name", null)
                                  # Type: string Required    

                                  optional = lookup(secret_ref.value, "optional", null)
                                  # Type: bool   Optional  

                                }
                              }

                            }
                          }

                          dynamic "lifecycle" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(container.value), "lifecycle") ? {item = container.value["lifecycle"]} : {}

                            content {
                              dynamic "post_start" { # Nesting Mode: list  
                                for_each = lookup(lifecycle.value, "postStart", {})

                                content {
                                  dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(post_start.value), "exec") ? {item = post_start.value["exec"]} : {}

                                    content {
                                      command = lookup(exec.value, "command", null)
                                      # Type: ['list', 'string']   Optional  

                                    }
                                  }

                                  dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(post_start.value), "httpGet") ? {item = post_start.value["httpGet"]} : {}

                                    content {
                                      host = lookup(http_get.value, "host", null)
                                      # Type: string   Optional  

                                      path = lookup(http_get.value, "path", null)
                                      # Type: string   Optional  

                                      port = lookup(http_get.value, "port", null)
                                      # Type: string   Optional  

                                      scheme = lookup(http_get.value, "scheme", null)
                                      # Type: string   Optional  

                                      dynamic "http_header" { # Nesting Mode: list  
                                        for_each = lookup(http_get.value, "httpHeaders", {})

                                        content {
                                          name = lookup(http_header.value, "name", null)
                                          # Type: string   Optional  

                                          value = lookup(http_header.value, "value", null)
                                          # Type: string   Optional  

                                        }
                                      }

                                    }
                                  }

                                  dynamic "tcp_socket" { # Nesting Mode: list  
                                    for_each = lookup(post_start.value, "tcpSocket", {})

                                    content {
                                      port = lookup(tcp_socket.value, "port", null)
                                      # Type: string Required    

                                    }
                                  }

                                }
                              }

                              dynamic "pre_stop" { # Nesting Mode: list  
                                for_each = lookup(lifecycle.value, "preStop", {})

                                content {
                                  dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(pre_stop.value), "exec") ? {item = pre_stop.value["exec"]} : {}

                                    content {
                                      command = lookup(exec.value, "command", null)
                                      # Type: ['list', 'string']   Optional  

                                    }
                                  }

                                  dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(pre_stop.value), "httpGet") ? {item = pre_stop.value["httpGet"]} : {}

                                    content {
                                      host = lookup(http_get.value, "host", null)
                                      # Type: string   Optional  

                                      path = lookup(http_get.value, "path", null)
                                      # Type: string   Optional  

                                      port = lookup(http_get.value, "port", null)
                                      # Type: string   Optional  

                                      scheme = lookup(http_get.value, "scheme", null)
                                      # Type: string   Optional  

                                      dynamic "http_header" { # Nesting Mode: list  
                                        for_each = lookup(http_get.value, "httpHeaders", {})

                                        content {
                                          name = lookup(http_header.value, "name", null)
                                          # Type: string   Optional  

                                          value = lookup(http_header.value, "value", null)
                                          # Type: string   Optional  

                                        }
                                      }

                                    }
                                  }

                                  dynamic "tcp_socket" { # Nesting Mode: list  
                                    for_each = lookup(pre_stop.value, "tcpSocket", {})

                                    content {
                                      port = lookup(tcp_socket.value, "port", null)
                                      # Type: string Required    

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "liveness_probe" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(container.value), "livenessProbe") ? {item = container.value["livenessProbe"]} : {}

                            content {
                              failure_threshold = lookup(liveness_probe.value, "failureThreshold", null)
                              # Type: number   Optional  

                              initial_delay_seconds = lookup(liveness_probe.value, "initialDelaySeconds", null)
                              # Type: number   Optional  

                              period_seconds = lookup(liveness_probe.value, "periodSeconds", null)
                              # Type: number   Optional  

                              success_threshold = lookup(liveness_probe.value, "successThreshold", null)
                              # Type: number   Optional  

                              timeout_seconds = lookup(liveness_probe.value, "timeoutSeconds", null)
                              # Type: number   Optional  

                              dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(liveness_probe.value), "exec") ? {item = liveness_probe.value["exec"]} : {}

                                content {
                                  command = lookup(exec.value, "command", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(liveness_probe.value), "httpGet") ? {item = liveness_probe.value["httpGet"]} : {}

                                content {
                                  host = lookup(http_get.value, "host", null)
                                  # Type: string   Optional  

                                  path = lookup(http_get.value, "path", null)
                                  # Type: string   Optional  

                                  port = lookup(http_get.value, "port", null)
                                  # Type: string   Optional  

                                  scheme = lookup(http_get.value, "scheme", null)
                                  # Type: string   Optional  

                                  dynamic "http_header" { # Nesting Mode: list  
                                    for_each = lookup(http_get.value, "httpHeaders", {})

                                    content {
                                      name = lookup(http_header.value, "name", null)
                                      # Type: string   Optional  

                                      value = lookup(http_header.value, "value", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                }
                              }

                              dynamic "tcp_socket" { # Nesting Mode: list  
                                for_each = lookup(liveness_probe.value, "tcpSocket", {})

                                content {
                                  port = lookup(tcp_socket.value, "port", null)
                                  # Type: string Required    

                                }
                              }

                            }
                          }

                          dynamic "port" { # Nesting Mode: list  
                            for_each = lookup(container.value, "ports", {})

                            content {
                              container_port = lookup(port.value, "containerPort", null)
                              # Type: number Required    

                              host_ip = lookup(port.value, "hostIP", null)
                              # Type: string   Optional  

                              host_port = lookup(port.value, "hostPort", null)
                              # Type: number   Optional  

                              name = lookup(port.value, "name", null)
                              # Type: string   Optional  

                              protocol = lookup(port.value, "protocol", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "readiness_probe" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(container.value), "readinessProbe") ? {item = container.value["readinessProbe"]} : {}

                            content {
                              failure_threshold = lookup(readiness_probe.value, "failureThreshold", null)
                              # Type: number   Optional  

                              initial_delay_seconds = lookup(readiness_probe.value, "initialDelaySeconds", null)
                              # Type: number   Optional  

                              period_seconds = lookup(readiness_probe.value, "periodSeconds", null)
                              # Type: number   Optional  

                              success_threshold = lookup(readiness_probe.value, "successThreshold", null)
                              # Type: number   Optional  

                              timeout_seconds = lookup(readiness_probe.value, "timeoutSeconds", null)
                              # Type: number   Optional  

                              dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(readiness_probe.value), "exec") ? {item = readiness_probe.value["exec"]} : {}

                                content {
                                  command = lookup(exec.value, "command", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(readiness_probe.value), "httpGet") ? {item = readiness_probe.value["httpGet"]} : {}

                                content {
                                  host = lookup(http_get.value, "host", null)
                                  # Type: string   Optional  

                                  path = lookup(http_get.value, "path", null)
                                  # Type: string   Optional  

                                  port = lookup(http_get.value, "port", null)
                                  # Type: string   Optional  

                                  scheme = lookup(http_get.value, "scheme", null)
                                  # Type: string   Optional  

                                  dynamic "http_header" { # Nesting Mode: list  
                                    for_each = lookup(http_get.value, "httpHeaders", {})

                                    content {
                                      name = lookup(http_header.value, "name", null)
                                      # Type: string   Optional  

                                      value = lookup(http_header.value, "value", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                }
                              }

                              dynamic "tcp_socket" { # Nesting Mode: list  
                                for_each = lookup(readiness_probe.value, "tcpSocket", {})

                                content {
                                  port = lookup(tcp_socket.value, "port", null)
                                  # Type: string Required    

                                }
                              }

                            }
                          }

                          dynamic "resources" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(container.value), "resources") ? {item = container.value["resources"]} : {}

                            content {
                              limits = lookup(resources.value, "limits", null)
                              # Type: ['map', 'string']   Optional Computed 

                              requests = lookup(resources.value, "requests", null)
                              # Type: ['map', 'string']   Optional Computed 

                            }
                          }

                          dynamic "security_context" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(container.value), "securityContext") ? {item = container.value["securityContext"]} : {}

                            content {
                              allow_privilege_escalation = lookup(security_context.value, "allowPrivilegeEscalation", null)
                              # Type: bool   Optional  

                              privileged = lookup(security_context.value, "privileged", null)
                              # Type: bool   Optional  

                              read_only_root_filesystem = lookup(security_context.value, "readOnlyRootFilesystem", null)
                              # Type: bool   Optional  

                              run_as_group = lookup(security_context.value, "runAsGroup", null)
                              # Type: string   Optional  

                              run_as_non_root = lookup(security_context.value, "runAsNonRoot", null)
                              # Type: bool   Optional  

                              run_as_user = lookup(security_context.value, "runAsUser", null)
                              # Type: string   Optional  

                              dynamic "capabilities" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(security_context.value), "capabilities") ? {item = security_context.value["capabilities"]} : {}

                                content {
                                  add = lookup(capabilities.value, "add", null)
                                  # Type: ['list', 'string']   Optional  

                                  drop = lookup(capabilities.value, "drop", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "se_linux_options" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(security_context.value), "seLinuxOptions") ? {item = security_context.value["seLinuxOptions"]} : {}

                                content {
                                  level = lookup(se_linux_options.value, "level", null)
                                  # Type: string   Optional  

                                  role = lookup(se_linux_options.value, "role", null)
                                  # Type: string   Optional  

                                  type = lookup(se_linux_options.value, "type", null)
                                  # Type: string   Optional  

                                  user = lookup(se_linux_options.value, "user", null)
                                  # Type: string   Optional  

                                }
                              }

                              dynamic "seccomp_profile" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(security_context.value), "seccompProfile") ? {item = security_context.value["seccompProfile"]} : {}

                                content {
                                  localhost_profile = lookup(seccomp_profile.value, "localhostProfile", null)
                                  # Type: string   Optional  

                                  type = lookup(seccomp_profile.value, "type", null)
                                  # Type: string   Optional  

                                }
                              }

                            }
                          }

                          dynamic "startup_probe" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(container.value), "startupProbe") ? {item = container.value["startupProbe"]} : {}

                            content {
                              failure_threshold = lookup(startup_probe.value, "failureThreshold", null)
                              # Type: number   Optional  

                              initial_delay_seconds = lookup(startup_probe.value, "initialDelaySeconds", null)
                              # Type: number   Optional  

                              period_seconds = lookup(startup_probe.value, "periodSeconds", null)
                              # Type: number   Optional  

                              success_threshold = lookup(startup_probe.value, "successThreshold", null)
                              # Type: number   Optional  

                              timeout_seconds = lookup(startup_probe.value, "timeoutSeconds", null)
                              # Type: number   Optional  

                              dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(startup_probe.value), "exec") ? {item = startup_probe.value["exec"]} : {}

                                content {
                                  command = lookup(exec.value, "command", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(startup_probe.value), "httpGet") ? {item = startup_probe.value["httpGet"]} : {}

                                content {
                                  host = lookup(http_get.value, "host", null)
                                  # Type: string   Optional  

                                  path = lookup(http_get.value, "path", null)
                                  # Type: string   Optional  

                                  port = lookup(http_get.value, "port", null)
                                  # Type: string   Optional  

                                  scheme = lookup(http_get.value, "scheme", null)
                                  # Type: string   Optional  

                                  dynamic "http_header" { # Nesting Mode: list  
                                    for_each = lookup(http_get.value, "httpHeaders", {})

                                    content {
                                      name = lookup(http_header.value, "name", null)
                                      # Type: string   Optional  

                                      value = lookup(http_header.value, "value", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                }
                              }

                              dynamic "tcp_socket" { # Nesting Mode: list  
                                for_each = lookup(startup_probe.value, "tcpSocket", {})

                                content {
                                  port = lookup(tcp_socket.value, "port", null)
                                  # Type: string Required    

                                }
                              }

                            }
                          }

                          dynamic "volume_mount" { # Nesting Mode: list  
                            for_each = lookup(container.value, "volumeMounts", {})

                            content {
                              mount_path = lookup(volume_mount.value, "mountPath", null)
                              # Type: string Required    

                              mount_propagation = lookup(volume_mount.value, "mountPropagation", null)
                              # Type: string   Optional  

                              name = lookup(volume_mount.value, "name", null)
                              # Type: string Required    

                              read_only = lookup(volume_mount.value, "readOnly", null)
                              # Type: bool   Optional  

                              sub_path = lookup(volume_mount.value, "subPath", null)
                              # Type: string   Optional  

                            }
                          }

                        }
                      }

                      dynamic "dns_config" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(spec.value), "dnsConfig") ? {item = spec.value["dnsConfig"]} : {}

                        content {
                          nameservers = lookup(dns_config.value, "nameservers", null)
                          # Type: ['list', 'string']   Optional  

                          searches = lookup(dns_config.value, "searches", null)
                          # Type: ['list', 'string']   Optional  

                          dynamic "option" { # Nesting Mode: list  
                            for_each = lookup(dns_config.value, "options", {})

                            content {
                              name = lookup(option.value, "name", null)
                              # Type: string Required    

                              value = lookup(option.value, "value", null)
                              # Type: string   Optional  

                            }
                          }

                        }
                      }

                      dynamic "host_aliases" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "hostAliases", {})

                        content {
                          hostnames = lookup(host_aliases.value, "hostnames", null)
                          # Type: ['list', 'string'] Required    

                          ip = lookup(host_aliases.value, "ip", null)
                          # Type: string Required    

                        }
                      }

                      dynamic "image_pull_secrets" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "imagePullSecrets", {})

                        content {
                          name = lookup(image_pull_secrets.value, "name", null)
                          # Type: string Required    

                        }
                      }

                      dynamic "init_container" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "initContainers", {})

                        content {
                          args = lookup(init_container.value, "args", null)
                          # Type: ['list', 'string']   Optional  

                          command = lookup(init_container.value, "command", null)
                          # Type: ['list', 'string']   Optional  

                          image = lookup(init_container.value, "image", null)
                          # Type: string   Optional  

                          image_pull_policy = lookup(init_container.value, "imagePullPolicy", null)
                          # Type: string   Optional Computed 

                          name = lookup(init_container.value, "name", null)
                          # Type: string Required    

                          stdin = lookup(init_container.value, "stdin", null)
                          # Type: bool   Optional  

                          stdin_once = lookup(init_container.value, "stdinOnce", null)
                          # Type: bool   Optional  

                          termination_message_path = lookup(init_container.value, "terminationMessagePath", null)
                          # Type: string   Optional  

                          termination_message_policy = lookup(init_container.value, "terminationMessagePolicy", null)
                          # Type: string   Optional Computed 

                          tty = lookup(init_container.value, "tty", null)
                          # Type: bool   Optional  

                          working_dir = lookup(init_container.value, "workingDir", null)
                          # Type: string   Optional  

                          dynamic "env" { # Nesting Mode: list  
                            for_each = lookup(init_container.value, "env", {})

                            content {
                              name = lookup(env.value, "name", null)
                              # Type: string Required    

                              value = lookup(env.value, "value", null)
                              # Type: string   Optional  

                              dynamic "value_from" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(env.value), "valueFrom") ? {item = env.value["valueFrom"]} : {}

                                content {
                                  dynamic "config_map_key_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "configMapKeyRef") ? {item = value_from.value["configMapKeyRef"]} : {}

                                    content {
                                      key = lookup(config_map_key_ref.value, "key", null)
                                      # Type: string   Optional  

                                      name = lookup(config_map_key_ref.value, "name", null)
                                      # Type: string   Optional  

                                      optional = lookup(config_map_key_ref.value, "optional", null)
                                      # Type: bool   Optional  

                                    }
                                  }

                                  dynamic "field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "fieldRef") ? {item = value_from.value["fieldRef"]} : {}

                                    content {
                                      api_version = lookup(field_ref.value, "apiVersion", null)
                                      # Type: string   Optional  

                                      field_path = lookup(field_ref.value, "fieldPath", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                  dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "resourceFieldRef") ? {item = value_from.value["resourceFieldRef"]} : {}

                                    content {
                                      container_name = lookup(resource_field_ref.value, "containerName", null)
                                      # Type: string   Optional  

                                      divisor = lookup(resource_field_ref.value, "divisor", null)
                                      # Type: string   Optional  

                                      resource = lookup(resource_field_ref.value, "resource", null)
                                      # Type: string Required    

                                    }
                                  }

                                  dynamic "secret_key_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(value_from.value), "secretKeyRef") ? {item = value_from.value["secretKeyRef"]} : {}

                                    content {
                                      key = lookup(secret_key_ref.value, "key", null)
                                      # Type: string   Optional  

                                      name = lookup(secret_key_ref.value, "name", null)
                                      # Type: string   Optional  

                                      optional = lookup(secret_key_ref.value, "optional", null)
                                      # Type: bool   Optional  

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "env_from" { # Nesting Mode: list  
                            for_each = lookup(init_container.value, "envFrom", {})

                            content {
                              prefix = lookup(env_from.value, "prefix", null)
                              # Type: string   Optional  

                              dynamic "config_map_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(env_from.value), "configMapRef") ? {item = env_from.value["configMapRef"]} : {}

                                content {
                                  name = lookup(config_map_ref.value, "name", null)
                                  # Type: string Required    

                                  optional = lookup(config_map_ref.value, "optional", null)
                                  # Type: bool   Optional  

                                }
                              }

                              dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(env_from.value), "secretRef") ? {item = env_from.value["secretRef"]} : {}

                                content {
                                  name = lookup(secret_ref.value, "name", null)
                                  # Type: string Required    

                                  optional = lookup(secret_ref.value, "optional", null)
                                  # Type: bool   Optional  

                                }
                              }

                            }
                          }

                          dynamic "lifecycle" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(init_container.value), "lifecycle") ? {item = init_container.value["lifecycle"]} : {}

                            content {
                              dynamic "post_start" { # Nesting Mode: list  
                                for_each = lookup(lifecycle.value, "postStart", {})

                                content {
                                  dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(post_start.value), "exec") ? {item = post_start.value["exec"]} : {}

                                    content {
                                      command = lookup(exec.value, "command", null)
                                      # Type: ['list', 'string']   Optional  

                                    }
                                  }

                                  dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(post_start.value), "httpGet") ? {item = post_start.value["httpGet"]} : {}

                                    content {
                                      host = lookup(http_get.value, "host", null)
                                      # Type: string   Optional  

                                      path = lookup(http_get.value, "path", null)
                                      # Type: string   Optional  

                                      port = lookup(http_get.value, "port", null)
                                      # Type: string   Optional  

                                      scheme = lookup(http_get.value, "scheme", null)
                                      # Type: string   Optional  

                                      dynamic "http_header" { # Nesting Mode: list  
                                        for_each = lookup(http_get.value, "httpHeaders", {})

                                        content {
                                          name = lookup(http_header.value, "name", null)
                                          # Type: string   Optional  

                                          value = lookup(http_header.value, "value", null)
                                          # Type: string   Optional  

                                        }
                                      }

                                    }
                                  }

                                  dynamic "tcp_socket" { # Nesting Mode: list  
                                    for_each = lookup(post_start.value, "tcpSocket", {})

                                    content {
                                      port = lookup(tcp_socket.value, "port", null)
                                      # Type: string Required    

                                    }
                                  }

                                }
                              }

                              dynamic "pre_stop" { # Nesting Mode: list  
                                for_each = lookup(lifecycle.value, "preStop", {})

                                content {
                                  dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(pre_stop.value), "exec") ? {item = pre_stop.value["exec"]} : {}

                                    content {
                                      command = lookup(exec.value, "command", null)
                                      # Type: ['list', 'string']   Optional  

                                    }
                                  }

                                  dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(pre_stop.value), "httpGet") ? {item = pre_stop.value["httpGet"]} : {}

                                    content {
                                      host = lookup(http_get.value, "host", null)
                                      # Type: string   Optional  

                                      path = lookup(http_get.value, "path", null)
                                      # Type: string   Optional  

                                      port = lookup(http_get.value, "port", null)
                                      # Type: string   Optional  

                                      scheme = lookup(http_get.value, "scheme", null)
                                      # Type: string   Optional  

                                      dynamic "http_header" { # Nesting Mode: list  
                                        for_each = lookup(http_get.value, "httpHeaders", {})

                                        content {
                                          name = lookup(http_header.value, "name", null)
                                          # Type: string   Optional  

                                          value = lookup(http_header.value, "value", null)
                                          # Type: string   Optional  

                                        }
                                      }

                                    }
                                  }

                                  dynamic "tcp_socket" { # Nesting Mode: list  
                                    for_each = lookup(pre_stop.value, "tcpSocket", {})

                                    content {
                                      port = lookup(tcp_socket.value, "port", null)
                                      # Type: string Required    

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "liveness_probe" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(init_container.value), "livenessProbe") ? {item = init_container.value["livenessProbe"]} : {}

                            content {
                              failure_threshold = lookup(liveness_probe.value, "failureThreshold", null)
                              # Type: number   Optional  

                              initial_delay_seconds = lookup(liveness_probe.value, "initialDelaySeconds", null)
                              # Type: number   Optional  

                              period_seconds = lookup(liveness_probe.value, "periodSeconds", null)
                              # Type: number   Optional  

                              success_threshold = lookup(liveness_probe.value, "successThreshold", null)
                              # Type: number   Optional  

                              timeout_seconds = lookup(liveness_probe.value, "timeoutSeconds", null)
                              # Type: number   Optional  

                              dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(liveness_probe.value), "exec") ? {item = liveness_probe.value["exec"]} : {}

                                content {
                                  command = lookup(exec.value, "command", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(liveness_probe.value), "httpGet") ? {item = liveness_probe.value["httpGet"]} : {}

                                content {
                                  host = lookup(http_get.value, "host", null)
                                  # Type: string   Optional  

                                  path = lookup(http_get.value, "path", null)
                                  # Type: string   Optional  

                                  port = lookup(http_get.value, "port", null)
                                  # Type: string   Optional  

                                  scheme = lookup(http_get.value, "scheme", null)
                                  # Type: string   Optional  

                                  dynamic "http_header" { # Nesting Mode: list  
                                    for_each = lookup(http_get.value, "httpHeaders", {})

                                    content {
                                      name = lookup(http_header.value, "name", null)
                                      # Type: string   Optional  

                                      value = lookup(http_header.value, "value", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                }
                              }

                              dynamic "tcp_socket" { # Nesting Mode: list  
                                for_each = lookup(liveness_probe.value, "tcpSocket", {})

                                content {
                                  port = lookup(tcp_socket.value, "port", null)
                                  # Type: string Required    

                                }
                              }

                            }
                          }

                          dynamic "port" { # Nesting Mode: list  
                            for_each = lookup(init_container.value, "ports", {})

                            content {
                              container_port = lookup(port.value, "containerPort", null)
                              # Type: number Required    

                              host_ip = lookup(port.value, "hostIP", null)
                              # Type: string   Optional  

                              host_port = lookup(port.value, "hostPort", null)
                              # Type: number   Optional  

                              name = lookup(port.value, "name", null)
                              # Type: string   Optional  

                              protocol = lookup(port.value, "protocol", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "readiness_probe" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(init_container.value), "readinessProbe") ? {item = init_container.value["readinessProbe"]} : {}

                            content {
                              failure_threshold = lookup(readiness_probe.value, "failureThreshold", null)
                              # Type: number   Optional  

                              initial_delay_seconds = lookup(readiness_probe.value, "initialDelaySeconds", null)
                              # Type: number   Optional  

                              period_seconds = lookup(readiness_probe.value, "periodSeconds", null)
                              # Type: number   Optional  

                              success_threshold = lookup(readiness_probe.value, "successThreshold", null)
                              # Type: number   Optional  

                              timeout_seconds = lookup(readiness_probe.value, "timeoutSeconds", null)
                              # Type: number   Optional  

                              dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(readiness_probe.value), "exec") ? {item = readiness_probe.value["exec"]} : {}

                                content {
                                  command = lookup(exec.value, "command", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(readiness_probe.value), "httpGet") ? {item = readiness_probe.value["httpGet"]} : {}

                                content {
                                  host = lookup(http_get.value, "host", null)
                                  # Type: string   Optional  

                                  path = lookup(http_get.value, "path", null)
                                  # Type: string   Optional  

                                  port = lookup(http_get.value, "port", null)
                                  # Type: string   Optional  

                                  scheme = lookup(http_get.value, "scheme", null)
                                  # Type: string   Optional  

                                  dynamic "http_header" { # Nesting Mode: list  
                                    for_each = lookup(http_get.value, "httpHeaders", {})

                                    content {
                                      name = lookup(http_header.value, "name", null)
                                      # Type: string   Optional  

                                      value = lookup(http_header.value, "value", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                }
                              }

                              dynamic "tcp_socket" { # Nesting Mode: list  
                                for_each = lookup(readiness_probe.value, "tcpSocket", {})

                                content {
                                  port = lookup(tcp_socket.value, "port", null)
                                  # Type: string Required    

                                }
                              }

                            }
                          }

                          dynamic "resources" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(init_container.value), "resources") ? {item = init_container.value["resources"]} : {}

                            content {
                              limits = lookup(resources.value, "limits", null)
                              # Type: ['map', 'string']   Optional Computed 

                              requests = lookup(resources.value, "requests", null)
                              # Type: ['map', 'string']   Optional Computed 

                            }
                          }

                          dynamic "security_context" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(init_container.value), "securityContext") ? {item = init_container.value["securityContext"]} : {}

                            content {
                              allow_privilege_escalation = lookup(security_context.value, "allowPrivilegeEscalation", null)
                              # Type: bool   Optional  

                              privileged = lookup(security_context.value, "privileged", null)
                              # Type: bool   Optional  

                              read_only_root_filesystem = lookup(security_context.value, "readOnlyRootFilesystem", null)
                              # Type: bool   Optional  

                              run_as_group = lookup(security_context.value, "runAsGroup", null)
                              # Type: string   Optional  

                              run_as_non_root = lookup(security_context.value, "runAsNonRoot", null)
                              # Type: bool   Optional  

                              run_as_user = lookup(security_context.value, "runAsUser", null)
                              # Type: string   Optional  

                              dynamic "capabilities" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(security_context.value), "capabilities") ? {item = security_context.value["capabilities"]} : {}

                                content {
                                  add = lookup(capabilities.value, "add", null)
                                  # Type: ['list', 'string']   Optional  

                                  drop = lookup(capabilities.value, "drop", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "se_linux_options" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(security_context.value), "seLinuxOptions") ? {item = security_context.value["seLinuxOptions"]} : {}

                                content {
                                  level = lookup(se_linux_options.value, "level", null)
                                  # Type: string   Optional  

                                  role = lookup(se_linux_options.value, "role", null)
                                  # Type: string   Optional  

                                  type = lookup(se_linux_options.value, "type", null)
                                  # Type: string   Optional  

                                  user = lookup(se_linux_options.value, "user", null)
                                  # Type: string   Optional  

                                }
                              }

                              dynamic "seccomp_profile" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(security_context.value), "seccompProfile") ? {item = security_context.value["seccompProfile"]} : {}

                                content {
                                  localhost_profile = lookup(seccomp_profile.value, "localhostProfile", null)
                                  # Type: string   Optional  

                                  type = lookup(seccomp_profile.value, "type", null)
                                  # Type: string   Optional  

                                }
                              }

                            }
                          }

                          dynamic "startup_probe" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(init_container.value), "startupProbe") ? {item = init_container.value["startupProbe"]} : {}

                            content {
                              failure_threshold = lookup(startup_probe.value, "failureThreshold", null)
                              # Type: number   Optional  

                              initial_delay_seconds = lookup(startup_probe.value, "initialDelaySeconds", null)
                              # Type: number   Optional  

                              period_seconds = lookup(startup_probe.value, "periodSeconds", null)
                              # Type: number   Optional  

                              success_threshold = lookup(startup_probe.value, "successThreshold", null)
                              # Type: number   Optional  

                              timeout_seconds = lookup(startup_probe.value, "timeoutSeconds", null)
                              # Type: number   Optional  

                              dynamic "exec" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(startup_probe.value), "exec") ? {item = startup_probe.value["exec"]} : {}

                                content {
                                  command = lookup(exec.value, "command", null)
                                  # Type: ['list', 'string']   Optional  

                                }
                              }

                              dynamic "http_get" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(startup_probe.value), "httpGet") ? {item = startup_probe.value["httpGet"]} : {}

                                content {
                                  host = lookup(http_get.value, "host", null)
                                  # Type: string   Optional  

                                  path = lookup(http_get.value, "path", null)
                                  # Type: string   Optional  

                                  port = lookup(http_get.value, "port", null)
                                  # Type: string   Optional  

                                  scheme = lookup(http_get.value, "scheme", null)
                                  # Type: string   Optional  

                                  dynamic "http_header" { # Nesting Mode: list  
                                    for_each = lookup(http_get.value, "httpHeaders", {})

                                    content {
                                      name = lookup(http_header.value, "name", null)
                                      # Type: string   Optional  

                                      value = lookup(http_header.value, "value", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                }
                              }

                              dynamic "tcp_socket" { # Nesting Mode: list  
                                for_each = lookup(startup_probe.value, "tcpSocket", {})

                                content {
                                  port = lookup(tcp_socket.value, "port", null)
                                  # Type: string Required    

                                }
                              }

                            }
                          }

                          dynamic "volume_mount" { # Nesting Mode: list  
                            for_each = lookup(init_container.value, "volumeMounts", {})

                            content {
                              mount_path = lookup(volume_mount.value, "mountPath", null)
                              # Type: string Required    

                              mount_propagation = lookup(volume_mount.value, "mountPropagation", null)
                              # Type: string   Optional  

                              name = lookup(volume_mount.value, "name", null)
                              # Type: string Required    

                              read_only = lookup(volume_mount.value, "readOnly", null)
                              # Type: bool   Optional  

                              sub_path = lookup(volume_mount.value, "subPath", null)
                              # Type: string   Optional  

                            }
                          }

                        }
                      }

                      dynamic "readiness_gate" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "readinessGate", {})

                        content {
                          condition_type = lookup(readiness_gate.value, "conditionType", null)
                          # Type: string Required    

                        }
                      }

                      dynamic "security_context" { # Nesting Mode: list  Max Items : 1  
                        for_each = contains(keys(spec.value), "securityContext") ? {item = spec.value["securityContext"]} : {}

                        content {
                          fs_group = lookup(security_context.value, "fsGroup", null)
                          # Type: string   Optional  

                          run_as_group = lookup(security_context.value, "runAsGroup", null)
                          # Type: string   Optional  

                          run_as_non_root = lookup(security_context.value, "runAsNonRoot", null)
                          # Type: bool   Optional  

                          run_as_user = lookup(security_context.value, "runAsUser", null)
                          # Type: string   Optional  

                          supplemental_groups = lookup(security_context.value, "supplementalGroups", null)
                          # Type: ['set', 'number']   Optional  

                          dynamic "se_linux_options" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(security_context.value), "seLinuxOptions") ? {item = security_context.value["seLinuxOptions"]} : {}

                            content {
                              level = lookup(se_linux_options.value, "level", null)
                              # Type: string   Optional  

                              role = lookup(se_linux_options.value, "role", null)
                              # Type: string   Optional  

                              type = lookup(se_linux_options.value, "type", null)
                              # Type: string   Optional  

                              user = lookup(se_linux_options.value, "user", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "seccomp_profile" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(security_context.value), "seccompProfile") ? {item = security_context.value["seccompProfile"]} : {}

                            content {
                              localhost_profile = lookup(seccomp_profile.value, "localhostProfile", null)
                              # Type: string   Optional  

                              type = lookup(seccomp_profile.value, "type", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "sysctl" { # Nesting Mode: list  
                            for_each = lookup(security_context.value, "sysctl", {})

                            content {
                              name = lookup(sysctl.value, "name", null)
                              # Type: string Required    

                              value = lookup(sysctl.value, "value", null)
                              # Type: string Required    

                            }
                          }

                        }
                      }

                      dynamic "toleration" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "tolerations", {})

                        content {
                          effect = lookup(toleration.value, "effect", null)
                          # Type: string   Optional  

                          key = lookup(toleration.value, "key", null)
                          # Type: string   Optional  

                          operator = lookup(toleration.value, "operator", null)
                          # Type: string   Optional  

                          toleration_seconds = lookup(toleration.value, "tolerationSeconds", null)
                          # Type: string   Optional  

                          value = lookup(toleration.value, "value", null)
                          # Type: string   Optional  

                        }
                      }

                      dynamic "topology_spread_constraint" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "topologySpreadConstraint", {})

                        content {
                          max_skew = lookup(topology_spread_constraint.value, "maxSkew", null)
                          # Type: number   Optional  

                          topology_key = lookup(topology_spread_constraint.value, "topologyKey", null)
                          # Type: string   Optional  

                          when_unsatisfiable = lookup(topology_spread_constraint.value, "whenUnsatisfiable", null)
                          # Type: string   Optional  

                          dynamic "label_selector" { # Nesting Mode: list  
                            for_each = contains(keys(topology_spread_constraint.value), "labelSelector") ? {item = topology_spread_constraint.value["labelSelector"]} : {}

                            content {
                              match_labels = lookup(label_selector.value, "matchLabels", null)
                              # Type: ['map', 'string']   Optional  

                              dynamic "match_expressions" { # Nesting Mode: list  
                                for_each = lookup(label_selector.value, "matchExpressions", {})

                                content {
                                  key = lookup(match_expressions.value, "key", null)
                                  # Type: string   Optional  

                                  operator = lookup(match_expressions.value, "operator", null)
                                  # Type: string   Optional  

                                  values = lookup(match_expressions.value, "values", null)
                                  # Type: ['set', 'string']   Optional  

                                }
                              }

                            }
                          }

                        }
                      }

                      dynamic "volume" { # Nesting Mode: list  
                        for_each = lookup(spec.value, "volumes", {})

                        content {
                          name = lookup(volume.value, "name", null)
                          # Type: string   Optional  

                          dynamic "aws_elastic_block_store" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "awsElasticBlockStore") ? {item = volume.value["awsElasticBlockStore"]} : {}

                            content {
                              fs_type = lookup(aws_elastic_block_store.value, "fsType", null)
                              # Type: string   Optional  

                              partition = lookup(aws_elastic_block_store.value, "partition", null)
                              # Type: number   Optional  

                              read_only = lookup(aws_elastic_block_store.value, "readOnly", null)
                              # Type: bool   Optional  

                              volume_id = lookup(aws_elastic_block_store.value, "volumeId", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "azure_disk" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "azureDisk") ? {item = volume.value["azureDisk"]} : {}

                            content {
                              caching_mode = lookup(azure_disk.value, "cachingMode", null)
                              # Type: string Required    

                              data_disk_uri = lookup(azure_disk.value, "dataDiskUri", null)
                              # Type: string Required    

                              disk_name = lookup(azure_disk.value, "diskName", null)
                              # Type: string Required    

                              fs_type = lookup(azure_disk.value, "fsType", null)
                              # Type: string   Optional  

                              kind = lookup(azure_disk.value, "kind", null)
                              # Type: string   Optional Computed 

                              read_only = lookup(azure_disk.value, "readOnly", null)
                              # Type: bool   Optional  

                            }
                          }

                          dynamic "azure_file" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "azureFile") ? {item = volume.value["azureFile"]} : {}

                            content {
                              read_only = lookup(azure_file.value, "readOnly", null)
                              # Type: bool   Optional  

                              secret_name = lookup(azure_file.value, "secretName", null)
                              # Type: string Required    

                              secret_namespace = lookup(azure_file.value, "secretNamespace", null)
                              # Type: string   Optional  

                              share_name = lookup(azure_file.value, "shareName", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "ceph_fs" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "cephFs") ? {item = volume.value["cephFs"]} : {}

                            content {
                              monitors = lookup(ceph_fs.value, "monitors", null)
                              # Type: ['set', 'string'] Required    

                              path = lookup(ceph_fs.value, "path", null)
                              # Type: string   Optional  

                              read_only = lookup(ceph_fs.value, "readOnly", null)
                              # Type: bool   Optional  

                              secret_file = lookup(ceph_fs.value, "secretFile", null)
                              # Type: string   Optional  

                              user = lookup(ceph_fs.value, "user", null)
                              # Type: string   Optional  

                              dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(ceph_fs.value), "secretRef") ? {item = ceph_fs.value["secretRef"]} : {}

                                content {
                                  name = lookup(secret_ref.value, "name", null)
                                  # Type: string   Optional  

                                  namespace = var.namespace != "" ? var.namespace : lookup(secret_ref.value, "namespace", null)
                                  # Type: string   Optional Computed 

                                }
                              }

                            }
                          }

                          dynamic "cinder" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "cinder") ? {item = volume.value["cinder"]} : {}

                            content {
                              fs_type = lookup(cinder.value, "fsType", null)
                              # Type: string   Optional  

                              read_only = lookup(cinder.value, "readOnly", null)
                              # Type: bool   Optional  

                              volume_id = lookup(cinder.value, "volumeId", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "config_map" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "configMap") ? {item = volume.value["configMap"]} : {}

                            content {
                              default_mode = lookup(config_map.value, "defaultMode", null)
                              # Type: string   Optional  

                              name = lookup(config_map.value, "name", null)
                              # Type: string   Optional  

                              optional = lookup(config_map.value, "optional", null)
                              # Type: bool   Optional  

                              dynamic "items" { # Nesting Mode: list  
                                for_each = lookup(config_map.value, "items", {})

                                content {
                                  key = lookup(items.value, "key", null)
                                  # Type: string   Optional  

                                  mode = lookup(items.value, "mode", null)
                                  # Type: string   Optional  

                                  path = lookup(items.value, "path", null)
                                  # Type: string   Optional  

                                }
                              }

                            }
                          }

                          dynamic "csi" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "csi") ? {item = volume.value["csi"]} : {}

                            content {
                              driver = lookup(csi.value, "driver", null)
                              # Type: string Required    

                              fs_type = lookup(csi.value, "fsType", null)
                              # Type: string   Optional  

                              read_only = lookup(csi.value, "readOnly", null)
                              # Type: bool   Optional  

                              volume_attributes = lookup(csi.value, "volumeAttributes", null)
                              # Type: ['map', 'string']   Optional  

                              dynamic "node_publish_secret_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(csi.value), "nodePublishSecretRef") ? {item = csi.value["nodePublishSecretRef"]} : {}

                                content {
                                  name = lookup(node_publish_secret_ref.value, "name", null)
                                  # Type: string   Optional  

                                }
                              }

                            }
                          }

                          dynamic "downward_api" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "downwardApi") ? {item = volume.value["downwardApi"]} : {}

                            content {
                              default_mode = lookup(downward_api.value, "defaultMode", null)
                              # Type: string   Optional  

                              dynamic "items" { # Nesting Mode: list  
                                for_each = lookup(downward_api.value, "items", {})

                                content {
                                  mode = lookup(items.value, "mode", null)
                                  # Type: string   Optional  

                                  path = lookup(items.value, "path", null)
                                  # Type: string Required    

                                  dynamic "field_ref" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
                                    for_each = contains(keys(items.value), "fieldRef") ? {item = items.value["fieldRef"]} : {}

                                    content {
                                      api_version = lookup(field_ref.value, "apiVersion", null)
                                      # Type: string   Optional  

                                      field_path = lookup(field_ref.value, "fieldPath", null)
                                      # Type: string   Optional  

                                    }
                                  }

                                  dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(items.value), "resourceFieldRef") ? {item = items.value["resourceFieldRef"]} : {}

                                    content {
                                      container_name = lookup(resource_field_ref.value, "containerName", null)
                                      # Type: string Required    

                                      divisor = lookup(resource_field_ref.value, "divisor", null)
                                      # Type: string   Optional  

                                      resource = lookup(resource_field_ref.value, "resource", null)
                                      # Type: string Required    

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "empty_dir" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "emptyDir") ? {item = volume.value["emptyDir"]} : {}

                            content {
                              medium = lookup(empty_dir.value, "medium", null)
                              # Type: string   Optional  

                              size_limit = lookup(empty_dir.value, "sizeLimit", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "fc" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "fc") ? {item = volume.value["fc"]} : {}

                            content {
                              fs_type = lookup(fc.value, "fsType", null)
                              # Type: string   Optional  

                              lun = lookup(fc.value, "lun", null)
                              # Type: number Required    

                              read_only = lookup(fc.value, "readOnly", null)
                              # Type: bool   Optional  

                              target_ww_ns = lookup(fc.value, "targetWwNs", null)
                              # Type: ['set', 'string'] Required    

                            }
                          }

                          dynamic "flex_volume" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "flexVolume") ? {item = volume.value["flexVolume"]} : {}

                            content {
                              driver = lookup(flex_volume.value, "driver", null)
                              # Type: string Required    

                              fs_type = lookup(flex_volume.value, "fsType", null)
                              # Type: string   Optional  

                              options = lookup(flex_volume.value, "options", null)
                              # Type: ['map', 'string']   Optional  

                              read_only = lookup(flex_volume.value, "readOnly", null)
                              # Type: bool   Optional  

                              dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(flex_volume.value), "secretRef") ? {item = flex_volume.value["secretRef"]} : {}

                                content {
                                  name = lookup(secret_ref.value, "name", null)
                                  # Type: string   Optional  

                                  namespace = var.namespace != "" ? var.namespace : lookup(secret_ref.value, "namespace", null)
                                  # Type: string   Optional Computed 

                                }
                              }

                            }
                          }

                          dynamic "flocker" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "flocker") ? {item = volume.value["flocker"]} : {}

                            content {
                              dataset_name = lookup(flocker.value, "datasetName", null)
                              # Type: string   Optional  

                              dataset_uuid = lookup(flocker.value, "datasetUuid", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "gce_persistent_disk" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "gcePersistentDisk") ? {item = volume.value["gcePersistentDisk"]} : {}

                            content {
                              fs_type = lookup(gce_persistent_disk.value, "fsType", null)
                              # Type: string   Optional  

                              partition = lookup(gce_persistent_disk.value, "partition", null)
                              # Type: number   Optional  

                              pd_name = lookup(gce_persistent_disk.value, "pdName", null)
                              # Type: string Required    

                              read_only = lookup(gce_persistent_disk.value, "readOnly", null)
                              # Type: bool   Optional  

                            }
                          }

                          dynamic "git_repo" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "gitRepo") ? {item = volume.value["gitRepo"]} : {}

                            content {
                              directory = lookup(git_repo.value, "directory", null)
                              # Type: string   Optional  

                              repository = lookup(git_repo.value, "repository", null)
                              # Type: string   Optional  

                              revision = lookup(git_repo.value, "revision", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "glusterfs" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "glusterfs") ? {item = volume.value["glusterfs"]} : {}

                            content {
                              endpoints_name = lookup(glusterfs.value, "endpointsName", null)
                              # Type: string Required    

                              path = lookup(glusterfs.value, "path", null)
                              # Type: string Required    

                              read_only = lookup(glusterfs.value, "readOnly", null)
                              # Type: bool   Optional  

                            }
                          }

                          dynamic "host_path" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "hostPath") ? {item = volume.value["hostPath"]} : {}

                            content {
                              path = lookup(host_path.value, "path", null)
                              # Type: string   Optional  

                              type = lookup(host_path.value, "type", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "iscsi" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "iscsi") ? {item = volume.value["iscsi"]} : {}

                            content {
                              fs_type = lookup(iscsi.value, "fsType", null)
                              # Type: string   Optional  

                              iqn = lookup(iscsi.value, "iqn", null)
                              # Type: string Required    

                              iscsi_interface = lookup(iscsi.value, "iscsiInterface", null)
                              # Type: string   Optional  

                              lun = lookup(iscsi.value, "lun", null)
                              # Type: number   Optional  

                              read_only = lookup(iscsi.value, "readOnly", null)
                              # Type: bool   Optional  

                              target_portal = lookup(iscsi.value, "targetPortal", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "local" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "local") ? {item = volume.value["local"]} : {}

                            content {
                              path = lookup(local.value, "path", null)
                              # Type: string   Optional  

                            }
                          }

                          dynamic "nfs" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "nfs") ? {item = volume.value["nfs"]} : {}

                            content {
                              path = lookup(nfs.value, "path", null)
                              # Type: string Required    

                              read_only = lookup(nfs.value, "readOnly", null)
                              # Type: bool   Optional  

                              server = lookup(nfs.value, "server", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "persistent_volume_claim" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "persistentVolumeClaim") ? {item = volume.value["persistentVolumeClaim"]} : {}

                            content {
                              claim_name = lookup(persistent_volume_claim.value, "claimName", null)
                              # Type: string   Optional  

                              read_only = lookup(persistent_volume_claim.value, "readOnly", null)
                              # Type: bool   Optional  

                            }
                          }

                          dynamic "photon_persistent_disk" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "photonPersistentDisk") ? {item = volume.value["photonPersistentDisk"]} : {}

                            content {
                              fs_type = lookup(photon_persistent_disk.value, "fsType", null)
                              # Type: string   Optional  

                              pd_id = lookup(photon_persistent_disk.value, "pdId", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "projected" { # Nesting Mode: list  
                            for_each = lookup(volume.value, "projected", {})

                            content {
                              default_mode = lookup(projected.value, "defaultMode", null)
                              # Type: string   Optional  

                              dynamic "sources" { # Nesting Mode: list  Min Items : 1  
                                for_each = lookup(projected.value, "sources", {})

                                content {
                                  dynamic "config_map" { # Nesting Mode: list  
                                    for_each = lookup(sources.value, "configMap", {})

                                    content {
                                      name = lookup(config_map.value, "name", null)
                                      # Type: string   Optional  

                                      optional = lookup(config_map.value, "optional", null)
                                      # Type: bool   Optional  

                                      dynamic "items" { # Nesting Mode: list  
                                        for_each = lookup(config_map.value, "items", {})

                                        content {
                                          key = lookup(items.value, "key", null)
                                          # Type: string   Optional  

                                          mode = lookup(items.value, "mode", null)
                                          # Type: string   Optional  

                                          path = lookup(items.value, "path", null)
                                          # Type: string   Optional  

                                        }
                                      }

                                    }
                                  }

                                  dynamic "downward_api" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(sources.value), "downwardApi") ? {item = sources.value["downwardApi"]} : {}

                                    content {
                                      dynamic "items" { # Nesting Mode: list  
                                        for_each = lookup(downward_api.value, "items", {})

                                        content {
                                          mode = lookup(items.value, "mode", null)
                                          # Type: string   Optional  

                                          path = lookup(items.value, "path", null)
                                          # Type: string Required    

                                          dynamic "field_ref" { # Nesting Mode: list  Max Items : 1  
                                            for_each = contains(keys(items.value), "fieldRef") ? {item = items.value["fieldRef"]} : {}

                                            content {
                                              api_version = lookup(field_ref.value, "apiVersion", null)
                                              # Type: string   Optional  

                                              field_path = lookup(field_ref.value, "fieldPath", null)
                                              # Type: string   Optional  

                                            }
                                          }

                                          dynamic "resource_field_ref" { # Nesting Mode: list  Max Items : 1  
                                            for_each = contains(keys(items.value), "resourceFieldRef") ? {item = items.value["resourceFieldRef"]} : {}

                                            content {
                                              container_name = lookup(resource_field_ref.value, "containerName", null)
                                              # Type: string Required    

                                              divisor = lookup(resource_field_ref.value, "divisor", null)
                                              # Type: string   Optional  

                                              resource = lookup(resource_field_ref.value, "resource", null)
                                              # Type: string Required    

                                            }
                                          }

                                        }
                                      }

                                    }
                                  }

                                  dynamic "secret" { # Nesting Mode: list  
                                    for_each = lookup(sources.value, "secret", {})

                                    content {
                                      name = lookup(secret.value, "name", null)
                                      # Type: string   Optional  

                                      optional = lookup(secret.value, "optional", null)
                                      # Type: bool   Optional  

                                      dynamic "items" { # Nesting Mode: list  
                                        for_each = lookup(secret.value, "items", {})

                                        content {
                                          key = lookup(items.value, "key", null)
                                          # Type: string   Optional  

                                          mode = lookup(items.value, "mode", null)
                                          # Type: string   Optional  

                                          path = lookup(items.value, "path", null)
                                          # Type: string   Optional  

                                        }
                                      }

                                    }
                                  }

                                  dynamic "service_account_token" { # Nesting Mode: list  Max Items : 1  
                                    for_each = contains(keys(sources.value), "serviceAccountToken") ? {item = sources.value["serviceAccountToken"]} : {}

                                    content {
                                      audience = lookup(service_account_token.value, "audience", null)
                                      # Type: string   Optional  

                                      expiration_seconds = lookup(service_account_token.value, "expirationSeconds", null)
                                      # Type: number   Optional  

                                      path = lookup(service_account_token.value, "path", null)
                                      # Type: string Required    

                                    }
                                  }

                                }
                              }

                            }
                          }

                          dynamic "quobyte" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "quobyte") ? {item = volume.value["quobyte"]} : {}

                            content {
                              group = lookup(quobyte.value, "group", null)
                              # Type: string   Optional  

                              read_only = lookup(quobyte.value, "readOnly", null)
                              # Type: bool   Optional  

                              registry = lookup(quobyte.value, "registry", null)
                              # Type: string Required    

                              user = lookup(quobyte.value, "user", null)
                              # Type: string   Optional  

                              volume = lookup(quobyte.value, "volume", null)
                              # Type: string Required    

                            }
                          }

                          dynamic "rbd" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "rbd") ? {item = volume.value["rbd"]} : {}

                            content {
                              ceph_monitors = lookup(rbd.value, "cephMonitors", null)
                              # Type: ['set', 'string'] Required    

                              fs_type = lookup(rbd.value, "fsType", null)
                              # Type: string   Optional  

                              keyring = lookup(rbd.value, "keyring", null)
                              # Type: string   Optional Computed 

                              rados_user = lookup(rbd.value, "radosUser", null)
                              # Type: string   Optional  

                              rbd_image = lookup(rbd.value, "rbdImage", null)
                              # Type: string Required    

                              rbd_pool = lookup(rbd.value, "rbdPool", null)
                              # Type: string   Optional  

                              read_only = lookup(rbd.value, "readOnly", null)
                              # Type: bool   Optional  

                              dynamic "secret_ref" { # Nesting Mode: list  Max Items : 1  
                                for_each = contains(keys(rbd.value), "secretRef") ? {item = rbd.value["secretRef"]} : {}

                                content {
                                  name = lookup(secret_ref.value, "name", null)
                                  # Type: string   Optional  

                                  namespace = var.namespace != "" ? var.namespace : lookup(secret_ref.value, "namespace", null)
                                  # Type: string   Optional Computed 

                                }
                              }

                            }
                          }

                          dynamic "secret" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "secret") ? {item = volume.value["secret"]} : {}

                            content {
                              default_mode = lookup(secret.value, "defaultMode", null)
                              # Type: string   Optional  

                              optional = lookup(secret.value, "optional", null)
                              # Type: bool   Optional  

                              secret_name = lookup(secret.value, "secretName", null)
                              # Type: string   Optional  

                              dynamic "items" { # Nesting Mode: list  
                                for_each = lookup(secret.value, "items", {})

                                content {
                                  key = lookup(items.value, "key", null)
                                  # Type: string   Optional  

                                  mode = lookup(items.value, "mode", null)
                                  # Type: string   Optional  

                                  path = lookup(items.value, "path", null)
                                  # Type: string   Optional  

                                }
                              }

                            }
                          }

                          dynamic "vsphere_volume" { # Nesting Mode: list  Max Items : 1  
                            for_each = contains(keys(volume.value), "vsphereVolume") ? {item = volume.value["vsphereVolume"]} : {}

                            content {
                              fs_type = lookup(vsphere_volume.value, "fsType", null)
                              # Type: string   Optional  

                              volume_path = lookup(vsphere_volume.value, "volumePath", null)
                              # Type: string Required    

                            }
                          }

                        }
                      }

                    }
                  }

                }
              }

            }
          }

        }
      }

    }
  }

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      delete = lookup(timeouts.value, "delete", null)
      # Type: string   Optional  

    }
  }


}