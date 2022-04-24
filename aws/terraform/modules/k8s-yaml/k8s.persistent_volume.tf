resource "kubernetes_persistent_volume" "instance" { 
  depends_on = [null_resource.module_depends_on]
  for_each = local.persistent_volume.applications

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

  dynamic "spec" { # Nesting Mode: list  Min Items : 1  
    for_each = lookup(each.value, "spec", {})

    content {
      access_modes = lookup(spec.value, "accessModes", null)
      # Type: ['set', 'string'] Required    

      capacity = lookup(spec.value, "capacity", null)
      # Type: ['map', 'string'] Required    

      mount_options = lookup(spec.value, "mountOptions", null)
      # Type: ['set', 'string']   Optional  

      persistent_volume_reclaim_policy = lookup(spec.value, "persistentVolumeReclaimPolicy", null)
      # Type: string   Optional  

      storage_class_name = lookup(spec.value, "storageClassName", null)
      # Type: string   Optional  

      volume_mode = lookup(spec.value, "volumeMode", null)
      # Type: string   Optional  

      dynamic "claim_ref" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "claimRef") ? {item = spec.value["claimRef"]} : {}

        content {
          name = lookup(claim_ref.value, "name", null)
          # Type: string Required    

          namespace = var.namespace != "" ? var.namespace : lookup(claim_ref.value, "namespace", null)
          # Type: string   Optional  

        }
      }

      dynamic "node_affinity" { # Nesting Mode: list  Max Items : 1  
        for_each = contains(keys(spec.value), "nodeAffinity") ? {item = spec.value["nodeAffinity"]} : {}

        content {
          dynamic "required" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(node_affinity.value), "required") ? {item = node_affinity.value["required"]} : {}

            content {
              dynamic "node_selector_term" { # Nesting Mode: list  Min Items : 1  
                for_each = lookup(required.value, "nodeSelectorTerms", {})

                content {
                  dynamic "match_expressions" { # Nesting Mode: list  
                    for_each = lookup(node_selector_term.value, "matchExpressions", {})

                    content {
                      key = lookup(match_expressions.value, "key", null)
                      # Type: string Required    

                      operator = lookup(match_expressions.value, "operator", null)
                      # Type: string Required    

                      values = lookup(match_expressions.value, "values", null)
                      # Type: ['set', 'string']   Optional  

                    }
                  }

                  dynamic "match_fields" { # Nesting Mode: list  
                    for_each = lookup(node_selector_term.value, "matchFields", {})

                    content {
                      key = lookup(match_fields.value, "key", null)
                      # Type: string Required    

                      operator = lookup(match_fields.value, "operator", null)
                      # Type: string Required    

                      values = lookup(match_fields.value, "values", null)
                      # Type: ['set', 'string']   Optional  

                    }
                  }

                }
              }

            }
          }

        }
      }

      dynamic "persistent_volume_source" { # Nesting Mode: list  Min Items : 1  Max Items : 1  
        for_each = contains(keys(spec.value), "persistentVolumeSource") ? {item = spec.value["persistentVolumeSource"]} : {}

        content {
          dynamic "aws_elastic_block_store" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "awsElasticBlockStore") ? {item = persistent_volume_source.value["awsElasticBlockStore"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "azureDisk") ? {item = persistent_volume_source.value["azureDisk"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "azureFile") ? {item = persistent_volume_source.value["azureFile"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "cephFs") ? {item = persistent_volume_source.value["cephFs"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "cinder") ? {item = persistent_volume_source.value["cinder"]} : {}

            content {
              fs_type = lookup(cinder.value, "fsType", null)
              # Type: string   Optional  

              read_only = lookup(cinder.value, "readOnly", null)
              # Type: bool   Optional  

              volume_id = lookup(cinder.value, "volumeId", null)
              # Type: string Required    

            }
          }

          dynamic "csi" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "csi") ? {item = persistent_volume_source.value["csi"]} : {}

            content {
              driver = lookup(csi.value, "driver", null)
              # Type: string Required    

              fs_type = lookup(csi.value, "fsType", null)
              # Type: string   Optional  

              read_only = lookup(csi.value, "readOnly", null)
              # Type: bool   Optional  

              volume_attributes = lookup(csi.value, "volumeAttributes", null)
              # Type: ['map', 'string']   Optional  

              volume_handle = lookup(csi.value, "volumeHandle", null)
              # Type: string Required    

              dynamic "controller_expand_secret_ref" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(csi.value), "controllerExpandSecretRef") ? {item = csi.value["controllerExpandSecretRef"]} : {}

                content {
                  name = lookup(controller_expand_secret_ref.value, "name", null)
                  # Type: string   Optional  

                  namespace = var.namespace != "" ? var.namespace : lookup(controller_expand_secret_ref.value, "namespace", null)
                  # Type: string   Optional Computed 

                }
              }

              dynamic "controller_publish_secret_ref" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(csi.value), "controllerPublishSecretRef") ? {item = csi.value["controllerPublishSecretRef"]} : {}

                content {
                  name = lookup(controller_publish_secret_ref.value, "name", null)
                  # Type: string   Optional  

                  namespace = var.namespace != "" ? var.namespace : lookup(controller_publish_secret_ref.value, "namespace", null)
                  # Type: string   Optional Computed 

                }
              }

              dynamic "node_publish_secret_ref" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(csi.value), "nodePublishSecretRef") ? {item = csi.value["nodePublishSecretRef"]} : {}

                content {
                  name = lookup(node_publish_secret_ref.value, "name", null)
                  # Type: string   Optional  

                  namespace = var.namespace != "" ? var.namespace : lookup(node_publish_secret_ref.value, "namespace", null)
                  # Type: string   Optional Computed 

                }
              }

              dynamic "node_stage_secret_ref" { # Nesting Mode: list  Max Items : 1  
                for_each = contains(keys(csi.value), "nodeStageSecretRef") ? {item = csi.value["nodeStageSecretRef"]} : {}

                content {
                  name = lookup(node_stage_secret_ref.value, "name", null)
                  # Type: string   Optional  

                  namespace = var.namespace != "" ? var.namespace : lookup(node_stage_secret_ref.value, "namespace", null)
                  # Type: string   Optional Computed 

                }
              }

            }
          }

          dynamic "fc" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "fc") ? {item = persistent_volume_source.value["fc"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "flexVolume") ? {item = persistent_volume_source.value["flexVolume"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "flocker") ? {item = persistent_volume_source.value["flocker"]} : {}

            content {
              dataset_name = lookup(flocker.value, "datasetName", null)
              # Type: string   Optional  

              dataset_uuid = lookup(flocker.value, "datasetUuid", null)
              # Type: string   Optional  

            }
          }

          dynamic "gce_persistent_disk" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "gcePersistentDisk") ? {item = persistent_volume_source.value["gcePersistentDisk"]} : {}

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

          dynamic "glusterfs" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "glusterfs") ? {item = persistent_volume_source.value["glusterfs"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "hostPath") ? {item = persistent_volume_source.value["hostPath"]} : {}

            content {
              path = lookup(host_path.value, "path", null)
              # Type: string   Optional  

              type = lookup(host_path.value, "type", null)
              # Type: string   Optional  

            }
          }

          dynamic "iscsi" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "iscsi") ? {item = persistent_volume_source.value["iscsi"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "local") ? {item = persistent_volume_source.value["local"]} : {}

            content {
              path = lookup(local.value, "path", null)
              # Type: string   Optional  

            }
          }

          dynamic "nfs" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "nfs") ? {item = persistent_volume_source.value["nfs"]} : {}

            content {
              path = lookup(nfs.value, "path", null)
              # Type: string Required    

              read_only = lookup(nfs.value, "readOnly", null)
              # Type: bool   Optional  

              server = lookup(nfs.value, "server", null)
              # Type: string Required    

            }
          }

          dynamic "photon_persistent_disk" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "photonPersistentDisk") ? {item = persistent_volume_source.value["photonPersistentDisk"]} : {}

            content {
              fs_type = lookup(photon_persistent_disk.value, "fsType", null)
              # Type: string   Optional  

              pd_id = lookup(photon_persistent_disk.value, "pdId", null)
              # Type: string Required    

            }
          }

          dynamic "quobyte" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "quobyte") ? {item = persistent_volume_source.value["quobyte"]} : {}

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
            for_each = contains(keys(persistent_volume_source.value), "rbd") ? {item = persistent_volume_source.value["rbd"]} : {}

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

          dynamic "vsphere_volume" { # Nesting Mode: list  Max Items : 1  
            for_each = contains(keys(persistent_volume_source.value), "vsphereVolume") ? {item = persistent_volume_source.value["vsphereVolume"]} : {}

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

  dynamic "timeouts" { # Nesting Mode: single  
    for_each = contains(keys(each.value), "timeouts") ? {item = each.value["timeouts"]} : {}

    content {
      create = lookup(timeouts.value, "create", null)
      # Type: string   Optional  

    }
  }


}