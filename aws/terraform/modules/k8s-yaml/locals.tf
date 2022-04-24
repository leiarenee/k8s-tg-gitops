locals {
  annotations = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "annotations", null)
        if contains(keys(lookup(value, "k8s", {})), "annotations") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "annotations", {}), "disabled", false)
    }
  }

  api_service = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "api_service", null)
        if contains(keys(lookup(value, "k8s", {})), "api_service") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "api_service", {}), "disabled", false)
    }
  }

  api_service_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "api_service_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "api_service_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "api_service_v1", {}), "disabled", false)
    }
  }

  certificate_signing_request = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "certificate_signing_request", null)
        if contains(keys(lookup(value, "k8s", {})), "certificate_signing_request") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "certificate_signing_request", {}), "disabled", false)
    }
  }

  certificate_signing_request_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "certificate_signing_request_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "certificate_signing_request_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "certificate_signing_request_v1", {}), "disabled", false)
    }
  }

  cluster_role = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cluster_role", null)
        if contains(keys(lookup(value, "k8s", {})), "cluster_role") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cluster_role", {}), "disabled", false)
    }
  }

  cluster_role_binding = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cluster_role_binding", null)
        if contains(keys(lookup(value, "k8s", {})), "cluster_role_binding") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cluster_role_binding", {}), "disabled", false)
    }
  }

  cluster_role_binding_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cluster_role_binding_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "cluster_role_binding_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cluster_role_binding_v1", {}), "disabled", false)
    }
  }

  cluster_role_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cluster_role_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "cluster_role_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cluster_role_v1", {}), "disabled", false)
    }
  }

  config_map = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "config_map", null)
        if contains(keys(lookup(value, "k8s", {})), "config_map") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "config_map", {}), "disabled", false)
    }
  }

  config_map_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "config_map_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "config_map_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "config_map_v1", {}), "disabled", false)
    }
  }

  config_map_v1_data = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "config_map_v1_data", null)
        if contains(keys(lookup(value, "k8s", {})), "config_map_v1_data") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "config_map_v1_data", {}), "disabled", false)
    }
  }

  cron_job = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cron_job", null)
        if contains(keys(lookup(value, "k8s", {})), "cron_job") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cron_job", {}), "disabled", false)
    }
  }

  cron_job_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "cron_job_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "cron_job_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "cron_job_v1", {}), "disabled", false)
    }
  }

  csi_driver = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "csi_driver", null)
        if contains(keys(lookup(value, "k8s", {})), "csi_driver") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "csi_driver", {}), "disabled", false)
    }
  }

  csi_driver_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "csi_driver_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "csi_driver_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "csi_driver_v1", {}), "disabled", false)
    }
  }

  daemon_set_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "daemon_set_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "daemon_set_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "daemon_set_v1", {}), "disabled", false)
    }
  }

  daemonset = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "daemonset", null)
        if contains(keys(lookup(value, "k8s", {})), "daemonset") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "daemonset", {}), "disabled", false)
    }
  }

  default_service_account = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "default_service_account", null)
        if contains(keys(lookup(value, "k8s", {})), "default_service_account") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "default_service_account", {}), "disabled", false)
    }
  }

  default_service_account_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "default_service_account_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "default_service_account_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "default_service_account_v1", {}), "disabled", false)
    }
  }

  deployment = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "deployment", null)
        if contains(keys(lookup(value, "k8s", {})), "deployment") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "deployment", {}), "disabled", false)
    }
  }

  deployment_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "deployment_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "deployment_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "deployment_v1", {}), "disabled", false)
    }
  }

  endpoints = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "endpoints", null)
        if contains(keys(lookup(value, "k8s", {})), "endpoints") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "endpoints", {}), "disabled", false)
    }
  }

  endpoints_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "endpoints_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "endpoints_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "endpoints_v1", {}), "disabled", false)
    }
  }

  horizontal_pod_autoscaler = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler", null)
        if contains(keys(lookup(value, "k8s", {})), "horizontal_pod_autoscaler") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler", {}), "disabled", false)
    }
  }

  horizontal_pod_autoscaler_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "horizontal_pod_autoscaler_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler_v1", {}), "disabled", false)
    }
  }

  horizontal_pod_autoscaler_v2beta2 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler_v2beta2", null)
        if contains(keys(lookup(value, "k8s", {})), "horizontal_pod_autoscaler_v2beta2") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "horizontal_pod_autoscaler_v2beta2", {}), "disabled", false)
    }
  }

  ingress = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "ingress", null)
        if contains(keys(lookup(value, "k8s", {})), "ingress") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "ingress", {}), "disabled", false)
    }
  }

  ingress_class = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "ingress_class", null)
        if contains(keys(lookup(value, "k8s", {})), "ingress_class") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "ingress_class", {}), "disabled", false)
    }
  }

  ingress_class_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "ingress_class_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "ingress_class_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "ingress_class_v1", {}), "disabled", false)
    }
  }

  ingress_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "ingress_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "ingress_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "ingress_v1", {}), "disabled", false)
    }
  }

  job = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "job", null)
        if contains(keys(lookup(value, "k8s", {})), "job") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "job", {}), "disabled", false)
    }
  }

  job_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "job_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "job_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "job_v1", {}), "disabled", false)
    }
  }

  labels = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "labels", null)
        if contains(keys(lookup(value, "k8s", {})), "labels") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "labels", {}), "disabled", false)
    }
  }

  limit_range = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "limit_range", null)
        if contains(keys(lookup(value, "k8s", {})), "limit_range") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "limit_range", {}), "disabled", false)
    }
  }

  limit_range_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "limit_range_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "limit_range_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "limit_range_v1", {}), "disabled", false)
    }
  }

  manifest = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "manifest", null)
        if contains(keys(lookup(value, "k8s", {})), "manifest") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "manifest", {}), "disabled", false)
    }
  }

  mutating_webhook_configuration = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "mutating_webhook_configuration", null)
        if contains(keys(lookup(value, "k8s", {})), "mutating_webhook_configuration") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "mutating_webhook_configuration", {}), "disabled", false)
    }
  }

  mutating_webhook_configuration_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "mutating_webhook_configuration_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "mutating_webhook_configuration_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "mutating_webhook_configuration_v1", {}), "disabled", false)
    }
  }

  namespace = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "namespace", null)
        if contains(keys(lookup(value, "k8s", {})), "namespace") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "namespace", {}), "disabled", false)
    }
  }

  namespace_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "namespace_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "namespace_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "namespace_v1", {}), "disabled", false)
    }
  }

  network_policy = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "network_policy", null)
        if contains(keys(lookup(value, "k8s", {})), "network_policy") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "network_policy", {}), "disabled", false)
    }
  }

  network_policy_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "network_policy_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "network_policy_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "network_policy_v1", {}), "disabled", false)
    }
  }

  persistent_volume = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "persistent_volume", null)
        if contains(keys(lookup(value, "k8s", {})), "persistent_volume") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "persistent_volume", {}), "disabled", false)
    }
  }

  persistent_volume_claim = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "persistent_volume_claim", null)
        if contains(keys(lookup(value, "k8s", {})), "persistent_volume_claim") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "persistent_volume_claim", {}), "disabled", false)
    }
  }

  persistent_volume_claim_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "persistent_volume_claim_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "persistent_volume_claim_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "persistent_volume_claim_v1", {}), "disabled", false)
    }
  }

  persistent_volume_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "persistent_volume_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "persistent_volume_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "persistent_volume_v1", {}), "disabled", false)
    }
  }

  pod = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod", null)
        if contains(keys(lookup(value, "k8s", {})), "pod") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod", {}), "disabled", false)
    }
  }

  pod_disruption_budget = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_disruption_budget", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_disruption_budget") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_disruption_budget", {}), "disabled", false)
    }
  }

  pod_disruption_budget_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_disruption_budget_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_disruption_budget_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_disruption_budget_v1", {}), "disabled", false)
    }
  }

  pod_security_policy = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_security_policy", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_security_policy") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_security_policy", {}), "disabled", false)
    }
  }

  pod_security_policy_v1beta1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_security_policy_v1beta1", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_security_policy_v1beta1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_security_policy_v1beta1", {}), "disabled", false)
    }
  }

  pod_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "pod_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "pod_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "pod_v1", {}), "disabled", false)
    }
  }

  priority_class = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "priority_class", null)
        if contains(keys(lookup(value, "k8s", {})), "priority_class") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "priority_class", {}), "disabled", false)
    }
  }

  priority_class_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "priority_class_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "priority_class_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "priority_class_v1", {}), "disabled", false)
    }
  }

  replication_controller = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "replication_controller", null)
        if contains(keys(lookup(value, "k8s", {})), "replication_controller") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "replication_controller", {}), "disabled", false)
    }
  }

  replication_controller_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "replication_controller_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "replication_controller_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "replication_controller_v1", {}), "disabled", false)
    }
  }

  resource_quota = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "resource_quota", null)
        if contains(keys(lookup(value, "k8s", {})), "resource_quota") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "resource_quota", {}), "disabled", false)
    }
  }

  resource_quota_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "resource_quota_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "resource_quota_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "resource_quota_v1", {}), "disabled", false)
    }
  }

  role = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "role", null)
        if contains(keys(lookup(value, "k8s", {})), "role") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "role", {}), "disabled", false)
    }
  }

  role_binding = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "role_binding", null)
        if contains(keys(lookup(value, "k8s", {})), "role_binding") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "role_binding", {}), "disabled", false)
    }
  }

  role_binding_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "role_binding_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "role_binding_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "role_binding_v1", {}), "disabled", false)
    }
  }

  role_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "role_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "role_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "role_v1", {}), "disabled", false)
    }
  }

  secret = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "secret", null)
        if contains(keys(lookup(value, "k8s", {})), "secret") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "secret", {}), "disabled", false)
    }
  }

  secret_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "secret_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "secret_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "secret_v1", {}), "disabled", false)
    }
  }

  service = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "service", null)
        if contains(keys(lookup(value, "k8s", {})), "service") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "service", {}), "disabled", false)
    }
  }

  service_account = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "service_account", null)
        if contains(keys(lookup(value, "k8s", {})), "service_account") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "service_account", {}), "disabled", false)
    }
  }

  service_account_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "service_account_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "service_account_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "service_account_v1", {}), "disabled", false)
    }
  }

  service_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "service_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "service_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "service_v1", {}), "disabled", false)
    }
  }

  stateful_set = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "stateful_set", null)
        if contains(keys(lookup(value, "k8s", {})), "stateful_set") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "stateful_set", {}), "disabled", false)
    }
  }

  stateful_set_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "stateful_set_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "stateful_set_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "stateful_set_v1", {}), "disabled", false)
    }
  }

  storage_class = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "storage_class", null)
        if contains(keys(lookup(value, "k8s", {})), "storage_class") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "storage_class", {}), "disabled", false)
    }
  }

  storage_class_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "storage_class_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "storage_class_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "storage_class_v1", {}), "disabled", false)
    }
  }

  validating_webhook_configuration = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "validating_webhook_configuration", null)
        if contains(keys(lookup(value, "k8s", {})), "validating_webhook_configuration") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "validating_webhook_configuration", {}), "disabled", false)
    }
  }

  validating_webhook_configuration_v1 = {
    applications = {
      for key, value in var.appConfig :
        key => lookup(lookup(value, "k8s", {}), "validating_webhook_configuration_v1", null)
        if contains(keys(lookup(value, "k8s", {})), "validating_webhook_configuration_v1") && var.module_enabled && !lookup(lookup(value, "k8s", {}), "disabled", false) && !lookup(lookup(lookup(value, "k8s", {}), "validating_webhook_configuration_v1", {}), "disabled", false)
    }
  }

}