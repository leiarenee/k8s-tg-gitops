# terraform-aws-codebuild

Terraform module to create AWS CodeBuild project for AWS CodePipeline.

Original Repo: https://github.com/cloudposse/terraform-aws-codebuild

## Usage


**IMPORTANT:** The `master` branch is used in `source` just as an example. In your code, do not pin to `master` because there may be breaking changes between releases.
Instead pin to the release tag (e.g. `?ref=tags/x.y.z`) of one of our [latest releases](https://github.com/cloudposse/terraform-aws-codebuild/releases).


Include this module in your existing terraform code:

```hcl
module "build" {
    source              = "git::https://github.com/cloudposse/terraform-aws-codebuild.git?ref=master"
    namespace           = "eg"
    stage               = "staging"
    name                = "app"

    # https://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref-available.html
    build_image         = "aws/codebuild/standard:2.0"
    build_compute_type  = "BUILD_GENERAL1_SMALL"
    build_timeout       = 60

    # These attributes are optional, used as ENV variables when building Docker images and pushing them to ECR
    # For more info:
    # http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html
    # https://www.terraform.io/docs/providers/aws/r/codebuild_project.html

    privileged_mode     = true
    aws_region          = "us-east-1"
    aws_account_id      = "xxxxxxxxxx"
    image_repo_name     = "ecr-repo-name"
    image_tag           = "latest"

    # Optional extra environment variables
    environment_variables = [{
        name  = "JENKINS_URL"
        value = "https://jenkins.example.com"
      },
      {
        name  = "COMPANY_NAME"
        value = "Amazon"
      },
      {
        name = "TIME_ZONE"
        value = "Pacific/Auckland"

      }]
}
```






## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| artifact_type | The build output artifact's type. Valid values for this parameter are: CODEPIPELINE, NO_ARTIFACTS or S3 | string | `CODEPIPELINE` | no |
| attributes | Additional attributes (e.g. `policy` or `role`) | list(string) | `<list>` | no |
| aws_account_id | (Optional) AWS Account ID. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html | string | `` | no |
| aws_region | (Optional) AWS Region, e.g. us-east-1. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html | string | `` | no |
| badge_enabled | Generates a publicly-accessible URL for the projects build badge. Available as badge_url attribute when enabled | bool | `false` | no |
| build_compute_type | Instance type of the build instance | string | `BUILD_GENERAL1_SMALL` | no |
| build_image | Docker image for build environment, e.g. 'aws/codebuild/standard:2.0' or 'aws/codebuild/eb-nodejs-6.10.0-amazonlinux-64:4.0.0'. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/build-env-ref.html | string | `aws/codebuild/standard:2.0` | no |
| build_timeout | How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related build that does not get marked as completed | string | `60` | no |
| buildspec | Optional buildspec declaration to use for building the project | string | `` | no |
| cache_bucket_suffix_enabled | The cache bucket generates a random 13 character string to generate a unique bucket name. If set to false it uses terraform-null-label's id value. It only works when cache_type is 'S3 | bool | `true` | no |
| cache_expiration_days | How many days should the build cache be kept. It only works when cache_type is 'S3' | string | `7` | no |
| cache_type | The type of storage that will be used for the AWS CodeBuild project cache. Valid values: NO_CACHE, LOCAL, and S3.  Defaults to NO_CACHE.  If cache_type is S3, it will create an S3 bucket for storing codebuild cache inside | string | `NO_CACHE` | no |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| enabled | A boolean to enable/disable resource creation | bool | `true` | no |
| environment_variables | A list of maps, that contain both the key 'name' and the key 'value' to be used as additional environment variables for the build | object | `<list>` | no |
| github_token | (Optional) GitHub auth token environment variable (`GITHUB_TOKEN`) | string | `` | no |
| image_repo_name | (Optional) ECR repository name to store the Docker image built by this module. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html | string | `UNSET` | no |
| image_tag | (Optional) Docker image tag in the ECR repository, e.g. 'latest'. Used as CodeBuild ENV variable when building Docker images. For more info: http://docs.aws.amazon.com/codebuild/latest/userguide/sample-docker.html | string | `latest` | no |
| local_cache_modes | Specifies settings that AWS CodeBuild uses to store and reuse build dependencies. Valid values: LOCAL_SOURCE_CACHE, LOCAL_DOCKER_LAYER_CACHE, and LOCAL_CUSTOM_CACHE | list(string) | `<list>` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | - | yes |
| namespace | Namespace, which could be your organization name, e.g. 'eg' or 'cp' | string | `` | no |
| privileged_mode | (Optional) If set to true, enables running the Docker daemon inside a Docker container on the CodeBuild instance. Used when building Docker images | bool | `false` | no |
| report_build_status | Set to true to report the status of a build's start and finish to your source provider. This option is only valid when the source_type is BITBUCKET or GITHUB | bool | `false` | no |
| source_location | The location of the source code from git or s3 | string | `` | no |
| source_type | The type of repository that contains the source code to be built. Valid values for this parameter are: CODECOMMIT, CODEPIPELINE, GITHUB, GITHUB_ENTERPRISE, BITBUCKET or S3 | string | `CODEPIPELINE` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', or 'test' | string | `` | no |
| tags | Additional tags (e.g. `map('BusinessUnit', 'XYZ')` | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| badge_url | The URL of the build badge when badge_enabled is enabled |
| cache_bucket_arn | Cache S3 bucket ARN |
| cache_bucket_name | Cache S3 bucket name |
| project_id | Project ID |
| project_name | Project name |
| role_arn | IAM Role ARN |
| role_id | IAM Role ID |


