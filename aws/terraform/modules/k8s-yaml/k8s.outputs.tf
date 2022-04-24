output "output" {
value = {
  for app, config in var.appConfig:
    app => {
      annotations = contains(keys(local.annotations.applications), app) ? {
      } : null

      api_service = contains(keys(local.api_service.applications), app) ? {
        metadata = {
          generation = try(kubernetes_api_service.instance[app].metadata.0.generation,null)
          name = try(kubernetes_api_service.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_api_service.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_api_service.instance[app].metadata.0.uid,null)
        }

      } : null

      api_service_v1 = contains(keys(local.api_service_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_api_service_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_api_service_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_api_service_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_api_service_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      certificate_signing_request = contains(keys(local.certificate_signing_request.applications), app) ? {
        certificate = try(kubernetes_certificate_signing_request.instance[app].certificate,null)
        metadata = {
          generation = try(kubernetes_certificate_signing_request.instance[app].metadata.0.generation,null)
          name = try(kubernetes_certificate_signing_request.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_certificate_signing_request.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_certificate_signing_request.instance[app].metadata.0.uid,null)
        }

      } : null

      certificate_signing_request_v1 = contains(keys(local.certificate_signing_request_v1.applications), app) ? {
        certificate = try(kubernetes_certificate_signing_request_v1.instance[app].certificate,null)
        metadata = {
          generation = try(kubernetes_certificate_signing_request_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_certificate_signing_request_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_certificate_signing_request_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_certificate_signing_request_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      cluster_role = contains(keys(local.cluster_role.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cluster_role.instance[app].metadata.0.generation,null)
          name = try(kubernetes_cluster_role.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_cluster_role.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_cluster_role.instance[app].metadata.0.uid,null)
        }

      } : null

      cluster_role_binding = contains(keys(local.cluster_role_binding.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cluster_role_binding.instance[app].metadata.0.generation,null)
          name = try(kubernetes_cluster_role_binding.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_cluster_role_binding.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_cluster_role_binding.instance[app].metadata.0.uid,null)
        }

        subject = {
          apiGroup = try(kubernetes_cluster_role_binding.instance[app].subject.0.api_group,null)
        }

      } : null

      cluster_role_binding_v1 = contains(keys(local.cluster_role_binding_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cluster_role_binding_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_cluster_role_binding_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_cluster_role_binding_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_cluster_role_binding_v1.instance[app].metadata.0.uid,null)
        }

        subject = {
          apiGroup = try(kubernetes_cluster_role_binding_v1.instance[app].subject.0.api_group,null)
        }

      } : null

      cluster_role_v1 = contains(keys(local.cluster_role_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cluster_role_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_cluster_role_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_cluster_role_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_cluster_role_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      config_map = contains(keys(local.config_map.applications), app) ? {
        metadata = {
          generation = try(kubernetes_config_map.instance[app].metadata.0.generation,null)
          name = try(kubernetes_config_map.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_config_map.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_config_map.instance[app].metadata.0.uid,null)
        }

      } : null

      config_map_v1 = contains(keys(local.config_map_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_config_map_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_config_map_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_config_map_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_config_map_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      config_map_v1_data = contains(keys(local.config_map_v1_data.applications), app) ? {
      } : null

      cron_job = contains(keys(local.cron_job.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cron_job.instance[app].metadata.0.generation,null)
          name = try(kubernetes_cron_job.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_cron_job.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_cron_job.instance[app].metadata.0.uid,null)
        }

        spec_job_template_metadata = {
          generation = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.generation,null)
          name = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.metadata.0.uid,null)
        }

        spec_job_template_spec = {
          completionMode = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.completion_mode,null)
        }

        spec_job_template_spec_template_metadata = {
          generation = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.uid,null)
        }

        spec_job_template_spec_template_spec = {
          hostname = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_job_template_spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_job_template_spec_template_spec_container_resources = {
          limits = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_job_template_spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_job_template_spec_template_spec_init_container_resources = {
          limits = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_job_template_spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_job_template_spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_job_template_spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_job_template_spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_job_template_spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_cron_job.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      cron_job_v1 = contains(keys(local.cron_job_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_cron_job_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_cron_job_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_cron_job_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_cron_job_v1.instance[app].metadata.0.uid,null)
        }

        spec_job_template_metadata = {
          generation = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.metadata.0.generation,null)
          name = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.metadata.0.uid,null)
        }

        spec_job_template_spec = {
          completionMode = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.completion_mode,null)
        }

        spec_job_template_spec_template_metadata = {
          generation = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.metadata.0.uid,null)
        }

        spec_job_template_spec_template_spec = {
          hostname = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_job_template_spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_job_template_spec_template_spec_container_resources = {
          limits = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_job_template_spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_job_template_spec_template_spec_init_container_resources = {
          limits = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_job_template_spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_job_template_spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_job_template_spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_job_template_spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_job_template_spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_cron_job_v1.instance[app].spec.0.job_template.0.spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      csi_driver = contains(keys(local.csi_driver.applications), app) ? {
        metadata = {
          generation = try(kubernetes_csi_driver.instance[app].metadata.0.generation,null)
          name = try(kubernetes_csi_driver.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_csi_driver.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_csi_driver.instance[app].metadata.0.uid,null)
        }

      } : null

      csi_driver_v1 = contains(keys(local.csi_driver_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_csi_driver_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_csi_driver_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_csi_driver_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_csi_driver_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      daemon_set_v1 = contains(keys(local.daemon_set_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_daemon_set_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_daemon_set_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_daemon_set_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_daemon_set_v1.instance[app].metadata.0.uid,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_daemon_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      daemonset = contains(keys(local.daemonset.applications), app) ? {
        metadata = {
          generation = try(kubernetes_daemonset.instance[app].metadata.0.generation,null)
          name = try(kubernetes_daemonset.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_daemonset.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_daemonset.instance[app].metadata.0.uid,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_daemonset.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_daemonset.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      default_service_account = contains(keys(local.default_service_account.applications), app) ? {
        defaultSecretName = try(kubernetes_default_service_account.instance[app].default_secret_name,null)
        metadata = {
          generation = try(kubernetes_default_service_account.instance[app].metadata.0.generation,null)
          resourceVersion = try(kubernetes_default_service_account.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_default_service_account.instance[app].metadata.0.uid,null)
        }

      } : null

      default_service_account_v1 = contains(keys(local.default_service_account_v1.applications), app) ? {
        defaultSecretName = try(kubernetes_default_service_account_v1.instance[app].default_secret_name,null)
        metadata = {
          generation = try(kubernetes_default_service_account_v1.instance[app].metadata.0.generation,null)
          resourceVersion = try(kubernetes_default_service_account_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_default_service_account_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      deployment = contains(keys(local.deployment.applications), app) ? {
        metadata = {
          generation = try(kubernetes_deployment.instance[app].metadata.0.generation,null)
          name = try(kubernetes_deployment.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_deployment.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_deployment.instance[app].metadata.0.uid,null)
        }

        spec = {
          replicas = try(kubernetes_deployment.instance[app].spec.0.replicas,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_deployment.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_deployment.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      deployment_v1 = contains(keys(local.deployment_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_deployment_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_deployment_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_deployment_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_deployment_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          replicas = try(kubernetes_deployment_v1.instance[app].spec.0.replicas,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_deployment_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      endpoints = contains(keys(local.endpoints.applications), app) ? {
        metadata = {
          generation = try(kubernetes_endpoints.instance[app].metadata.0.generation,null)
          name = try(kubernetes_endpoints.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_endpoints.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_endpoints.instance[app].metadata.0.uid,null)
        }

      } : null

      endpoints_v1 = contains(keys(local.endpoints_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_endpoints_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_endpoints_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_endpoints_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_endpoints_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      horizontal_pod_autoscaler = contains(keys(local.horizontal_pod_autoscaler.applications), app) ? {
        metadata = {
          generation = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.generation,null)
          name = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_horizontal_pod_autoscaler.instance[app].metadata.0.uid,null)
        }

        spec = {
          targetCpuUtilizationPercentage = try(kubernetes_horizontal_pod_autoscaler.instance[app].spec.0.target_cpu_utilization_percentage,null)
        }

      } : null

      horizontal_pod_autoscaler_v1 = contains(keys(local.horizontal_pod_autoscaler_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_horizontal_pod_autoscaler_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_horizontal_pod_autoscaler_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_horizontal_pod_autoscaler_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_horizontal_pod_autoscaler_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          targetCpuUtilizationPercentage = try(kubernetes_horizontal_pod_autoscaler_v1.instance[app].spec.0.target_cpu_utilization_percentage,null)
        }

      } : null

      horizontal_pod_autoscaler_v2beta2 = contains(keys(local.horizontal_pod_autoscaler_v2beta2.applications), app) ? {
        metadata = {
          generation = try(kubernetes_horizontal_pod_autoscaler_v2beta2.instance[app].metadata.0.generation,null)
          name = try(kubernetes_horizontal_pod_autoscaler_v2beta2.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_horizontal_pod_autoscaler_v2beta2.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_horizontal_pod_autoscaler_v2beta2.instance[app].metadata.0.uid,null)
        }

        spec = {
          targetCpuUtilizationPercentage = try(kubernetes_horizontal_pod_autoscaler_v2beta2.instance[app].spec.0.target_cpu_utilization_percentage,null)
        }

      } : null

      ingress = contains(keys(local.ingress.applications), app) ? {
        status = try(kubernetes_ingress.instance[app].status,null)
        metadata = {
          generation = try(kubernetes_ingress.instance[app].metadata.0.generation,null)
          name = try(kubernetes_ingress.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_ingress.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_ingress.instance[app].metadata.0.uid,null)
        }

        spec_backend = {
          servicePort = try(kubernetes_ingress.instance[app].spec.0.backend.0.service_port,null)
        }

        spec_rule_http_path_backend = {
          servicePort = try(kubernetes_ingress.instance[app].spec.0.rule.0.http.0.path.0.backend.0.service_port,null)
        }

      } : null

      ingress_class = contains(keys(local.ingress_class.applications), app) ? {
        metadata = {
          generation = try(kubernetes_ingress_class.instance[app].metadata.0.generation,null)
          name = try(kubernetes_ingress_class.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_ingress_class.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_ingress_class.instance[app].metadata.0.uid,null)
        }

        spec_parameters = {
          scope = try(kubernetes_ingress_class.instance[app].spec.0.parameters.0.scope,null)
        }

      } : null

      ingress_class_v1 = contains(keys(local.ingress_class_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_ingress_class_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_ingress_class_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_ingress_class_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_ingress_class_v1.instance[app].metadata.0.uid,null)
        }

        spec_parameters = {
          scope = try(kubernetes_ingress_class_v1.instance[app].spec.0.parameters.0.scope,null)
        }

      } : null

      ingress_v1 = contains(keys(local.ingress_v1.applications), app) ? {
        status = try(kubernetes_ingress_v1.instance[app].status,null)
        metadata = {
          generation = try(kubernetes_ingress_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_ingress_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_ingress_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_ingress_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      job = contains(keys(local.job.applications), app) ? {
        metadata = {
          generation = try(kubernetes_job.instance[app].metadata.0.generation,null)
          labels = try(kubernetes_job.instance[app].metadata.0.labels,null)
          name = try(kubernetes_job.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_job.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_job.instance[app].metadata.0.uid,null)
        }

        spec = {
          completionMode = try(kubernetes_job.instance[app].spec.0.completion_mode,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_job.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_job.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      job_v1 = contains(keys(local.job_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_job_v1.instance[app].metadata.0.generation,null)
          labels = try(kubernetes_job_v1.instance[app].metadata.0.labels,null)
          name = try(kubernetes_job_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_job_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_job_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          completionMode = try(kubernetes_job_v1.instance[app].spec.0.completion_mode,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_job_v1.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_job_v1.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_job_v1.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_job_v1.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_job_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      labels = contains(keys(local.labels.applications), app) ? {
      } : null

      limit_range = contains(keys(local.limit_range.applications), app) ? {
        metadata = {
          generation = try(kubernetes_limit_range.instance[app].metadata.0.generation,null)
          name = try(kubernetes_limit_range.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_limit_range.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_limit_range.instance[app].metadata.0.uid,null)
        }

        spec_limit = {
          defaultRequest = try(kubernetes_limit_range.instance[app].spec.0.limit.0.default_request,null)
        }

      } : null

      limit_range_v1 = contains(keys(local.limit_range_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_limit_range_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_limit_range_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_limit_range_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_limit_range_v1.instance[app].metadata.0.uid,null)
        }

        spec_limit = {
          defaultRequest = try(kubernetes_limit_range_v1.instance[app].spec.0.limit.0.default_request,null)
        }

      } : null

      manifest = contains(keys(local.manifest.applications), app) ? {
        object = try(kubernetes_manifest.instance[app].object,null)
      } : null

      mutating_webhook_configuration = contains(keys(local.mutating_webhook_configuration.applications), app) ? {
        metadata = {
          generation = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.generation,null)
          name = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_mutating_webhook_configuration.instance[app].metadata.0.uid,null)
        }

      } : null

      mutating_webhook_configuration_v1 = contains(keys(local.mutating_webhook_configuration_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_mutating_webhook_configuration_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_mutating_webhook_configuration_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_mutating_webhook_configuration_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_mutating_webhook_configuration_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      namespace = contains(keys(local.namespace.applications), app) ? {
        metadata = {
          generation = try(kubernetes_namespace.instance[app].metadata.0.generation,null)
          name = try(kubernetes_namespace.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_namespace.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_namespace.instance[app].metadata.0.uid,null)
        }

      } : null

      namespace_v1 = contains(keys(local.namespace_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_namespace_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_namespace_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_namespace_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_namespace_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      network_policy = contains(keys(local.network_policy.applications), app) ? {
        metadata = {
          generation = try(kubernetes_network_policy.instance[app].metadata.0.generation,null)
          name = try(kubernetes_network_policy.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_network_policy.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_network_policy.instance[app].metadata.0.uid,null)
        }

      } : null

      network_policy_v1 = contains(keys(local.network_policy_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_network_policy_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_network_policy_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_network_policy_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_network_policy_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      persistent_volume = contains(keys(local.persistent_volume.applications), app) ? {
        metadata = {
          generation = try(kubernetes_persistent_volume.instance[app].metadata.0.generation,null)
          name = try(kubernetes_persistent_volume.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_persistent_volume.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_persistent_volume.instance[app].metadata.0.uid,null)
        }

        spec_persistent_volume_source_azure_disk = {
          kind = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.azure_disk.0.kind,null)
        }

        spec_persistent_volume_source_ceph_fs_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.controller_expand_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.controller_publish_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.node_publish_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.csi.0.node_stage_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_flex_volume_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_rbd = {
          keyring = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.rbd.0.keyring,null)
        }

        spec_persistent_volume_source_rbd_secret_ref = {
          namespace = try(kubernetes_persistent_volume.instance[app].spec.0.persistent_volume_source.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      persistent_volume_claim = contains(keys(local.persistent_volume_claim.applications), app) ? {
        metadata = {
          generation = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.generation,null)
          name = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_persistent_volume_claim.instance[app].metadata.0.uid,null)
        }

        spec = {
          storageClassName = try(kubernetes_persistent_volume_claim.instance[app].spec.0.storage_class_name,null)
          volumeName = try(kubernetes_persistent_volume_claim.instance[app].spec.0.volume_name,null)
        }

      } : null

      persistent_volume_claim_v1 = contains(keys(local.persistent_volume_claim_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_persistent_volume_claim_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_persistent_volume_claim_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_persistent_volume_claim_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_persistent_volume_claim_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          storageClassName = try(kubernetes_persistent_volume_claim_v1.instance[app].spec.0.storage_class_name,null)
          volumeName = try(kubernetes_persistent_volume_claim_v1.instance[app].spec.0.volume_name,null)
        }

      } : null

      persistent_volume_v1 = contains(keys(local.persistent_volume_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_persistent_volume_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_persistent_volume_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_persistent_volume_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_persistent_volume_v1.instance[app].metadata.0.uid,null)
        }

        spec_persistent_volume_source_azure_disk = {
          kind = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.azure_disk.0.kind,null)
        }

        spec_persistent_volume_source_ceph_fs_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_controller_expand_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.csi.0.controller_expand_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_controller_publish_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.csi.0.controller_publish_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_node_publish_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.csi.0.node_publish_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_csi_node_stage_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.csi.0.node_stage_secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_flex_volume_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_persistent_volume_source_rbd = {
          keyring = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.rbd.0.keyring,null)
        }

        spec_persistent_volume_source_rbd_secret_ref = {
          namespace = try(kubernetes_persistent_volume_v1.instance[app].spec.0.persistent_volume_source.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      pod = contains(keys(local.pod.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod.instance[app].metadata.0.generation,null)
          name = try(kubernetes_pod.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_pod.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_pod.instance[app].metadata.0.uid,null)
        }

        spec = {
          hostname = try(kubernetes_pod.instance[app].spec.0.hostname,null)
          nodeName = try(kubernetes_pod.instance[app].spec.0.node_name,null)
          serviceAccountName = try(kubernetes_pod.instance[app].spec.0.service_account_name,null)
        }

        spec_container = {
          imagePullPolicy = try(kubernetes_pod.instance[app].spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_pod.instance[app].spec.0.container.0.termination_message_policy,null)
        }

        spec_container_resources = {
          limits = try(kubernetes_pod.instance[app].spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_pod.instance[app].spec.0.container.0.resources.0.requests,null)
        }

        spec_init_container = {
          imagePullPolicy = try(kubernetes_pod.instance[app].spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_pod.instance[app].spec.0.init_container.0.termination_message_policy,null)
        }

        spec_init_container_resources = {
          limits = try(kubernetes_pod.instance[app].spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_pod.instance[app].spec.0.init_container.0.resources.0.requests,null)
        }

        spec_volume_azure_disk = {
          kind = try(kubernetes_pod.instance[app].spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_volume_rbd = {
          keyring = try(kubernetes_pod.instance[app].spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_pod.instance[app].spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      pod_disruption_budget = contains(keys(local.pod_disruption_budget.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.generation,null)
          name = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_pod_disruption_budget.instance[app].metadata.0.uid,null)
        }

      } : null

      pod_disruption_budget_v1 = contains(keys(local.pod_disruption_budget_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_disruption_budget_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_pod_disruption_budget_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_pod_disruption_budget_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_pod_disruption_budget_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      pod_security_policy = contains(keys(local.pod_security_policy.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_security_policy.instance[app].metadata.0.generation,null)
          name = try(kubernetes_pod_security_policy.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_pod_security_policy.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_pod_security_policy.instance[app].metadata.0.uid,null)
        }

        spec = {
          allowPrivilegeEscalation = try(kubernetes_pod_security_policy.instance[app].spec.0.allow_privilege_escalation,null)
          allowedCapabilities = try(kubernetes_pod_security_policy.instance[app].spec.0.allowed_capabilities,null)
          defaultAllowPrivilegeEscalation = try(kubernetes_pod_security_policy.instance[app].spec.0.default_allow_privilege_escalation,null)
          hostIpc = try(kubernetes_pod_security_policy.instance[app].spec.0.host_ipc,null)
          hostNetwork = try(kubernetes_pod_security_policy.instance[app].spec.0.host_network,null)
          hostPid = try(kubernetes_pod_security_policy.instance[app].spec.0.host_pid,null)
          privileged = try(kubernetes_pod_security_policy.instance[app].spec.0.privileged,null)
          readOnlyRootFilesystem = try(kubernetes_pod_security_policy.instance[app].spec.0.read_only_root_filesystem,null)
          requiredDropCapabilities = try(kubernetes_pod_security_policy.instance[app].spec.0.required_drop_capabilities,null)
          volumes = try(kubernetes_pod_security_policy.instance[app].spec.0.volumes,null)
        }

      } : null

      pod_security_policy_v1beta1 = contains(keys(local.pod_security_policy_v1beta1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_security_policy_v1beta1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_pod_security_policy_v1beta1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_pod_security_policy_v1beta1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_pod_security_policy_v1beta1.instance[app].metadata.0.uid,null)
        }

        spec = {
          allowPrivilegeEscalation = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.allow_privilege_escalation,null)
          allowedCapabilities = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.allowed_capabilities,null)
          defaultAllowPrivilegeEscalation = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.default_allow_privilege_escalation,null)
          hostIpc = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.host_ipc,null)
          hostNetwork = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.host_network,null)
          hostPid = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.host_pid,null)
          privileged = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.privileged,null)
          readOnlyRootFilesystem = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.read_only_root_filesystem,null)
          requiredDropCapabilities = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.required_drop_capabilities,null)
          volumes = try(kubernetes_pod_security_policy_v1beta1.instance[app].spec.0.volumes,null)
        }

      } : null

      pod_v1 = contains(keys(local.pod_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_pod_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_pod_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_pod_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_pod_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          hostname = try(kubernetes_pod_v1.instance[app].spec.0.hostname,null)
          nodeName = try(kubernetes_pod_v1.instance[app].spec.0.node_name,null)
          serviceAccountName = try(kubernetes_pod_v1.instance[app].spec.0.service_account_name,null)
        }

        spec_container = {
          imagePullPolicy = try(kubernetes_pod_v1.instance[app].spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_pod_v1.instance[app].spec.0.container.0.termination_message_policy,null)
        }

        spec_container_resources = {
          limits = try(kubernetes_pod_v1.instance[app].spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_pod_v1.instance[app].spec.0.container.0.resources.0.requests,null)
        }

        spec_init_container = {
          imagePullPolicy = try(kubernetes_pod_v1.instance[app].spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_pod_v1.instance[app].spec.0.init_container.0.termination_message_policy,null)
        }

        spec_init_container_resources = {
          limits = try(kubernetes_pod_v1.instance[app].spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_pod_v1.instance[app].spec.0.init_container.0.resources.0.requests,null)
        }

        spec_volume_azure_disk = {
          kind = try(kubernetes_pod_v1.instance[app].spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_pod_v1.instance[app].spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_pod_v1.instance[app].spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_volume_rbd = {
          keyring = try(kubernetes_pod_v1.instance[app].spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_pod_v1.instance[app].spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      priority_class = contains(keys(local.priority_class.applications), app) ? {
        metadata = {
          generation = try(kubernetes_priority_class.instance[app].metadata.0.generation,null)
          name = try(kubernetes_priority_class.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_priority_class.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_priority_class.instance[app].metadata.0.uid,null)
        }

      } : null

      priority_class_v1 = contains(keys(local.priority_class_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_priority_class_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_priority_class_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_priority_class_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_priority_class_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      replication_controller = contains(keys(local.replication_controller.applications), app) ? {
        metadata = {
          generation = try(kubernetes_replication_controller.instance[app].metadata.0.generation,null)
          name = try(kubernetes_replication_controller.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_replication_controller.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_replication_controller.instance[app].metadata.0.uid,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_replication_controller.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          activeDeadlineSeconds = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.active_deadline_seconds,null)
          dnsPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.dns_policy,null)
          hostIpc = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.host_ipc,null)
          hostNetwork = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.host_network,null)
          hostPid = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.host_pid,null)
          hostname = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.node_name,null)
          nodeSelector = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.node_selector,null)
          priorityClassName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.priority_class_name,null)
          restartPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.restart_policy,null)
          serviceAccountName = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          subdomain = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.subdomain,null)
          terminationGracePeriodSeconds = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.termination_grace_period_seconds,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_replication_controller.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      replication_controller_v1 = contains(keys(local.replication_controller_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_replication_controller_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_replication_controller_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_replication_controller_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_replication_controller_v1.instance[app].metadata.0.uid,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          activeDeadlineSeconds = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.active_deadline_seconds,null)
          dnsPolicy = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.dns_policy,null)
          hostIpc = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.host_ipc,null)
          hostNetwork = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.host_network,null)
          hostPid = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.host_pid,null)
          hostname = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.node_name,null)
          nodeSelector = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.node_selector,null)
          priorityClassName = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.priority_class_name,null)
          restartPolicy = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.restart_policy,null)
          serviceAccountName = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.service_account_name,null)
          subdomain = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.subdomain,null)
          terminationGracePeriodSeconds = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.termination_grace_period_seconds,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_replication_controller_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

      } : null

      resource_quota = contains(keys(local.resource_quota.applications), app) ? {
        metadata = {
          generation = try(kubernetes_resource_quota.instance[app].metadata.0.generation,null)
          name = try(kubernetes_resource_quota.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_resource_quota.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_resource_quota.instance[app].metadata.0.uid,null)
        }

      } : null

      resource_quota_v1 = contains(keys(local.resource_quota_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_resource_quota_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_resource_quota_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_resource_quota_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_resource_quota_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      role = contains(keys(local.role.applications), app) ? {
        metadata = {
          generation = try(kubernetes_role.instance[app].metadata.0.generation,null)
          name = try(kubernetes_role.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_role.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_role.instance[app].metadata.0.uid,null)
        }

      } : null

      role_binding = contains(keys(local.role_binding.applications), app) ? {
        metadata = {
          generation = try(kubernetes_role_binding.instance[app].metadata.0.generation,null)
          name = try(kubernetes_role_binding.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_role_binding.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_role_binding.instance[app].metadata.0.uid,null)
        }

        subject = {
          apiGroup = try(kubernetes_role_binding.instance[app].subject.0.api_group,null)
        }

      } : null

      role_binding_v1 = contains(keys(local.role_binding_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_role_binding_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_role_binding_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_role_binding_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_role_binding_v1.instance[app].metadata.0.uid,null)
        }

        subject = {
          apiGroup = try(kubernetes_role_binding_v1.instance[app].subject.0.api_group,null)
        }

      } : null

      role_v1 = contains(keys(local.role_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_role_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_role_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_role_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_role_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      secret = contains(keys(local.secret.applications), app) ? {
        data = try(kubernetes_secret.instance[app].data,null)
        metadata = {
          generation = try(kubernetes_secret.instance[app].metadata.0.generation,null)
          name = try(kubernetes_secret.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_secret.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_secret.instance[app].metadata.0.uid,null)
        }

      } : null

      secret_v1 = contains(keys(local.secret_v1.applications), app) ? {
        data = try(kubernetes_secret_v1.instance[app].data,null)
        metadata = {
          generation = try(kubernetes_secret_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_secret_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_secret_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_secret_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      service = contains(keys(local.service.applications), app) ? {
        status = try(kubernetes_service.instance[app].status,null)
        metadata = {
          generation = try(kubernetes_service.instance[app].metadata.0.generation,null)
          name = try(kubernetes_service.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_service.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_service.instance[app].metadata.0.uid,null)
        }

        spec = {
          clusterIp = try(kubernetes_service.instance[app].spec.0.cluster_ip,null)
          externalTrafficPolicy = try(kubernetes_service.instance[app].spec.0.external_traffic_policy,null)
          healthCheckNodePort = try(kubernetes_service.instance[app].spec.0.health_check_node_port,null)
        }

        spec_port = {
          nodePort = try(kubernetes_service.instance[app].spec.0.port.0.node_port,null)
          targetPort = try(kubernetes_service.instance[app].spec.0.port.0.target_port,null)
        }

      } : null

      service_account = contains(keys(local.service_account.applications), app) ? {
        defaultSecretName = try(kubernetes_service_account.instance[app].default_secret_name,null)
        metadata = {
          generation = try(kubernetes_service_account.instance[app].metadata.0.generation,null)
          name = try(kubernetes_service_account.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_service_account.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_service_account.instance[app].metadata.0.uid,null)
        }

      } : null

      service_account_v1 = contains(keys(local.service_account_v1.applications), app) ? {
        defaultSecretName = try(kubernetes_service_account_v1.instance[app].default_secret_name,null)
        metadata = {
          generation = try(kubernetes_service_account_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_service_account_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_service_account_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_service_account_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      service_v1 = contains(keys(local.service_v1.applications), app) ? {
        status = try(kubernetes_service_v1.instance[app].status,null)
        metadata = {
          generation = try(kubernetes_service_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_service_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_service_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_service_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          clusterIp = try(kubernetes_service_v1.instance[app].spec.0.cluster_ip,null)
          externalTrafficPolicy = try(kubernetes_service_v1.instance[app].spec.0.external_traffic_policy,null)
          healthCheckNodePort = try(kubernetes_service_v1.instance[app].spec.0.health_check_node_port,null)
        }

        spec_port = {
          nodePort = try(kubernetes_service_v1.instance[app].spec.0.port.0.node_port,null)
          targetPort = try(kubernetes_service_v1.instance[app].spec.0.port.0.target_port,null)
        }

      } : null

      stateful_set = contains(keys(local.stateful_set.applications), app) ? {
        metadata = {
          generation = try(kubernetes_stateful_set.instance[app].metadata.0.generation,null)
          name = try(kubernetes_stateful_set.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_stateful_set.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_stateful_set.instance[app].metadata.0.uid,null)
        }

        spec = {
          podManagementPolicy = try(kubernetes_stateful_set.instance[app].spec.0.pod_management_policy,null)
          replicas = try(kubernetes_stateful_set.instance[app].spec.0.replicas,null)
          revisionHistoryLimit = try(kubernetes_stateful_set.instance[app].spec.0.revision_history_limit,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_stateful_set.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_stateful_set.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

        spec_volume_claim_template_metadata = {
          generation = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.generation,null)
          name = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.metadata.0.uid,null)
        }

        spec_volume_claim_template_spec = {
          storageClassName = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.spec.0.storage_class_name,null)
          volumeName = try(kubernetes_stateful_set.instance[app].spec.0.volume_claim_template.0.spec.0.volume_name,null)
        }

      } : null

      stateful_set_v1 = contains(keys(local.stateful_set_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_stateful_set_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_stateful_set_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_stateful_set_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_stateful_set_v1.instance[app].metadata.0.uid,null)
        }

        spec = {
          podManagementPolicy = try(kubernetes_stateful_set_v1.instance[app].spec.0.pod_management_policy,null)
          replicas = try(kubernetes_stateful_set_v1.instance[app].spec.0.replicas,null)
          revisionHistoryLimit = try(kubernetes_stateful_set_v1.instance[app].spec.0.revision_history_limit,null)
        }

        spec_template_metadata = {
          generation = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.metadata.0.generation,null)
          name = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.metadata.0.uid,null)
        }

        spec_template_spec = {
          hostname = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.hostname,null)
          nodeName = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.node_name,null)
          serviceAccountName = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.service_account_name,null)
        }

        spec_template_spec_container = {
          imagePullPolicy = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.container.0.termination_message_policy,null)
        }

        spec_template_spec_container_resources = {
          limits = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.limits,null)
          requests = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.container.0.resources.0.requests,null)
        }

        spec_template_spec_init_container = {
          imagePullPolicy = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.image_pull_policy,null)
          terminationMessagePolicy = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.termination_message_policy,null)
        }

        spec_template_spec_init_container_resources = {
          limits = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.limits,null)
          requests = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.init_container.0.resources.0.requests,null)
        }

        spec_template_spec_volume_azure_disk = {
          kind = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.azure_disk.0.kind,null)
        }

        spec_template_spec_volume_ceph_fs_secret_ref = {
          namespace = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.ceph_fs.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_flex_volume_secret_ref = {
          namespace = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.flex_volume.0.secret_ref.0.namespace,null)
        }

        spec_template_spec_volume_rbd = {
          keyring = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.keyring,null)
        }

        spec_template_spec_volume_rbd_secret_ref = {
          namespace = try(kubernetes_stateful_set_v1.instance[app].spec.0.template.0.spec.0.volume.0.rbd.0.secret_ref.0.namespace,null)
        }

        spec_volume_claim_template_metadata = {
          generation = try(kubernetes_stateful_set_v1.instance[app].spec.0.volume_claim_template.0.metadata.0.generation,null)
          name = try(kubernetes_stateful_set_v1.instance[app].spec.0.volume_claim_template.0.metadata.0.name,null)
          resourceVersion = try(kubernetes_stateful_set_v1.instance[app].spec.0.volume_claim_template.0.metadata.0.resource_version,null)
          uid = try(kubernetes_stateful_set_v1.instance[app].spec.0.volume_claim_template.0.metadata.0.uid,null)
        }

        spec_volume_claim_template_spec = {
          storageClassName = try(kubernetes_stateful_set_v1.instance[app].spec.0.volume_claim_template.0.spec.0.storage_class_name,null)
          volumeName = try(kubernetes_stateful_set_v1.instance[app].spec.0.volume_claim_template.0.spec.0.volume_name,null)
        }

      } : null

      storage_class = contains(keys(local.storage_class.applications), app) ? {
        metadata = {
          generation = try(kubernetes_storage_class.instance[app].metadata.0.generation,null)
          name = try(kubernetes_storage_class.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_storage_class.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_storage_class.instance[app].metadata.0.uid,null)
        }

      } : null

      storage_class_v1 = contains(keys(local.storage_class_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_storage_class_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_storage_class_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_storage_class_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_storage_class_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      validating_webhook_configuration = contains(keys(local.validating_webhook_configuration.applications), app) ? {
        metadata = {
          generation = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.generation,null)
          name = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_validating_webhook_configuration.instance[app].metadata.0.uid,null)
        }

      } : null

      validating_webhook_configuration_v1 = contains(keys(local.validating_webhook_configuration_v1.applications), app) ? {
        metadata = {
          generation = try(kubernetes_validating_webhook_configuration_v1.instance[app].metadata.0.generation,null)
          name = try(kubernetes_validating_webhook_configuration_v1.instance[app].metadata.0.name,null)
          resourceVersion = try(kubernetes_validating_webhook_configuration_v1.instance[app].metadata.0.resource_version,null)
          uid = try(kubernetes_validating_webhook_configuration_v1.instance[app].metadata.0.uid,null)
        }

      } : null

      }
  }
}
