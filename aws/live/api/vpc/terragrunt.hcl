locals {
  global_replacements = jsondecode(file(find_in_parent_folders("replace.json")))
  local_replacements = jsondecode(file("replace.json"))
  replacements = merge(local.global_replacements, local.local_replacements)
}

include {
 path = find_in_parent_folders()
}

terraform {
  source = "${get_parent_terragrunt_dir()}//aws/terraform/components/vpc"
  extra_arguments extra_args {
    commands = get_terraform_commands_that_need_locking()
    env_vars = {"k8s_dependency":false}
  }
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  replace_variables = merge(local.replacements,{})
}
