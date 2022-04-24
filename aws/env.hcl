# Set common variables for the environment. This is automatically pulled in in the root terragrunt.hcl configuration to
# feed forward to the child modules.
locals {
  environment = "testing"

  tags = {
    environment   = local.environment
    created_with  = "terraform"
  }

  environment_variables = [{
      name  = "COMPANY_URL"
      value = "https://mycompany.com/"
    },
    {
      name  = "COMPANY_NAME"
      value = "My Company"
    },
    {
      name = "TIME_ZONE"
      value = "CET"

    }]
  
  vcs_credentials = {
    github = {
      user_name   = "used from secret manager"
      token       = "used from secret manager"
    }
  }

}
