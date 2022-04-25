locals {
  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  # Extract the variables we need for easy access
  repository_credentials = local.environment_vars.locals.vcs_credentials["github"]

  # Get global replacements
  global_replacements = jsondecode(file(find_in_parent_folders("replace.json")))
  local_replacements = jsondecode(file("replace.json"))
  replacements = merge(local.global_replacements, local.local_replacements)

  # Get commit hash
  commit_hash = run_cmd("${get_parent_terragrunt_dir()}/scripts/get_commit_hash.sh", local.global_replacements.REPO_SSH, local.global_replacements.BRANCH)

  # Read general buildspec.yml file
  buildspec = file(find_in_parent_folders("buildspec.yml"))
}

terraform {
  source = "${get_parent_terragrunt_dir()}//aws/terraform/components/codebuild"
  extra_arguments extra_args {
    commands = get_terraform_commands_that_need_locking()
    env_vars = {"k8s_dependency":false}
  }
}

include {
  path = find_in_parent_folders()
}

inputs = {  
  source_credential_user_name   = local.repository_credentials.user_name
  source_credential_token       = local.repository_credentials.token
  replace_variables             = merge(local.replacements,{COMMIT_HASH=local.commit_hash})
  buildspec                     = local.buildspec
  
}



