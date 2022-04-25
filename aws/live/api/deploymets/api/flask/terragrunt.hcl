locals {
  # Get global replacements
  global_replacements = jsondecode(file(find_in_parent_folders("replace.json")))
  local_replacements = jsondecode(file("replace.json"))
  replacements = merge(local.global_replacements, local.local_replacements)
}

terraform {
  source = "${get_parent_terragrunt_dir()}//aws/terraform/modules/deploy-application"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

inputs = {
  module_enabled = true
  replace_variables             = merge(local.replacements,{
    IMAGE_URL=dependency.build.outputs.repository_image_full_name_tag
    }
  )
}

dependencies {
 paths = ["../../shared/namespace"]
}

dependency "build" {
  config_path = "../../../build/flask"
}
