# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules,
# remote state, and locking: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------

locals {
  scripts_folder = "scripts"
  all_commands=["apply", "plan","destroy","apply-all","plan-all","destroy-all"]

  # Automatically load account-level variables
  account_config = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  override_file = "${get_parent_terragrunt_dir()}/.override.hcl"
  override_exists = fileexists(local.override_file)
  override_config = local.override_exists ? read_terragrunt_config(local.override_file) : null
  override_vars = local.override_exists ? local.override_config.locals : null
  override = local.override_exists ? local.override_vars.override_active : false
  account = local.override ? lookup(local.override_vars, local.override_vars.config) : lookup(local.branches, local.branch)
  branch = local.override ? "" : replace(run_cmd("${get_parent_terragrunt_dir()}/${local.scripts_folder}/git_branch.sh",local.override),"\n","")
  branches = local.override ? {} : local.account_config.locals.branch
  json_acc = jsonencode(local.account)
  tgpath = get_parent_terragrunt_dir()
  hclpath = path_relative_to_include()
  platform = get_platform()
  tg_command = get_terraform_command()
  aws_caller_identity_arn = get_aws_caller_identity_arn()
  aws_caller_identity_user_id = get_aws_caller_identity_user_id()
  confirm = replace(run_cmd("${get_parent_terragrunt_dir()}/${local.scripts_folder}/confirm_account.sh", local.tgpath, local.hclpath, local.json_acc, local.platform, local.tg_command, local.aws_caller_identity_arn, local.aws_caller_identity_user_id, local.override ? local.override_vars.config : "Branch:${local.branch}"),"\n","")
  
  # Automatically load region-level variables
  region_config = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  region = local.region_config.locals

  # Automatically load environment-level variables
  environment_config = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  environment = local.environment_config.locals

  # Extract the variables we need for easy access
  
  account_name = local.account.account_name
  account_id   = local.account.aws_account_id
  aws_profile  = local.account.aws_profile
  bucket_suffix  = local.account.bucket_suffix
  aws_region   = local.region.aws_region
  assume_profile = lookup(local.account, "parent_profile", local.aws_profile)

  common_inputs = {
    # aws_batch_id = get_env("AWS_BATCH_ID")
  }

}

# Generate an AWS provider block
generate "provider" {
  path      = "aws-provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"

  # Only these AWS Account IDs may be operated on by this template
  # allowed_account_ids = ["${local.account_id}"]
}

provider "aws" {
  alias = "eu-central-1"
  region = "eu-central-1"

}
EOF
}

# Generate common variables
generate "common_variables" {
  path      = "common_variables.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
variable "replace_variables" {
  description = ""
  type = any
  default = {}
}

variable "region" {
  description = "AWS Region"
  default = "${local.aws_region}"
}

variable "user_id" {
  description = "The user_id of the participant"
  default = ""
}

variable "user_email" {
  description = "The e-mail of the participant"
  default = ""
}

variable "uuid" {
  description = "Automatically generated uuid for each session"
  default = ""
}

variable "aws_batch_id" {
  description = "aws batch id"
  default = ""
}

variable "common_tags" {
  type = map
  description = "Common tags"
  default = {}
}

EOF
}
# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "tfstate-${local.account_id}-${local.aws_region}${(local.bucket_suffix != null && local.bucket_suffix != "") ? "-${local.bucket_suffix}" : ""}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    profile        = local.assume_profile 
    dynamodb_table = "terraform-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

terraform {
  before_hook "before_hook_2" {
    commands     = local.all_commands
    execute      = ["${get_parent_terragrunt_dir()}/${local.scripts_folder}/replace.sh","$TF_VAR_replace_variables",".","self","yaml,yml,json,jsn","false",2,jsonencode(local.account.parameters)]
   }
   
  before_hook "before_hook_1" {
    commands     = concat(local.all_commands, ["init", "init-all"])
    execute      = ["${get_parent_terragrunt_dir()}/scripts/copy-common-modules.sh", get_parent_terragrunt_dir()]
   }

  # after_hook "after_hook_1" {
  #   commands     = local.all_commands
  #   execute      = ["${get_parent_terragrunt_dir()}/${local.scripts_folder}/job_complete.sh", path_relative_to_include()]
  #  }

  before_hook "before_hook_3" {
    commands     = concat(local.all_commands, ["init", "init-all"])
    execute      = ["${get_parent_terragrunt_dir()}/scripts/refresh-kube-token.sh", local.aws_profile, local.account.parameters.CLUSTER, local.account_id, local.aws_region]
   }

  extra_arguments "arguments" {
    commands = concat(local.all_commands, ["init", "init-all"])
    required_var_files = ["inputs.tfvars.json"]
    env_vars = {
      TG_PARRENT_DIR=get_parent_terragrunt_dir()
      # TG_MODULES_LIST=get_env("TG_MODULES_LIST")
      # TG_MODULES_COUNT=get_env("TG_MODULES_COUNT")
      # SQS_QUEUE_URL=get_env("SQS_QUEUE_URL")
      # SQS_MESSAGE_GROUP_ID=get_env("SQS_MESSAGE_GROUP_ID")
      # SQS_AWS_PROFILE=get_env("SQS_AWS_PROFILE")
      # INITIAL_PROGRESS=get_env("INITIAL_PROGRESS")
      # MODULES_FINAL_PROGRESS=get_env("MODULES_FINAL_PROGRESS")
      AWS_PROFILE=local.aws_profile
      AWS_DEFAULT_REGION=local.aws_region
      TF_PLUGIN_CACHE_DIR="${get_env("HOME")}/.terraform.d/plugin-cache"
    }
    arguments = ["-var","replace_variables=0"]
  }

}
# ---------------------------------------------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ---------------------------------------------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  local.account,
  local.region,
  local.environment,
  local.common_inputs,
  { common_tags = local.common_inputs }
)

# download_dir = "${get_parent_terragrunt_dir()}/.terragrunt-cache/${local.account_id}/${path_relative_to_include()}"
iam_role = lookup(local.account, "iam_role", null )