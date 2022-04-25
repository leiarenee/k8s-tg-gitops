locals {
  # Get global replacements
  global_replacements = jsondecode(file(find_in_parent_folders("replace.json")))
  local_replacements = jsondecode(file("replace.json"))
  replacements = merge(local.global_replacements, local.local_replacements)
}

terraform {
  #source = "git::git@github.org:bettermarks/terraform-modules.git//deploy-service"
  source = "${get_parent_terragrunt_dir()}//aws/terraform/modules/deploy-service"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
  module_enabled = true
  replace_variables             = merge(local.replacements,{})
}

dependencies {
 paths = ["../../../../shared/namespace"]
}