
include {
 path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}//modules/vpc-k8s-cluster"
  extra_arguments extra_args {
    commands = get_terraform_commands_that_need_locking()
    env_vars = {"k8s_dependency":false}
  }
}

