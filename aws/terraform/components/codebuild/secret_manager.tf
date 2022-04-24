data "aws_secretsmanager_secret" "repo" {
  name = ! var.use_arn_for_secret_manager_name ? var.secret_manager_name_for_repo : null
  arn = var.use_arn_for_secret_manager_name ? var.secret_manager_name_for_repo : null
  provider = aws.secrets
}

data "aws_secretsmanager_secret_version" "repo" {
  provider = aws.secrets
  secret_id = data.aws_secretsmanager_secret.repo.id
}

locals {
  secret_string = jsondecode(data.aws_secretsmanager_secret_version.repo.secret_string)
  repo_user=local.secret_string["user"]
  repo_token=local.secret_string["token"]

}
