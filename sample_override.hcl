# Override paramaters for your own account
# Dublicate this file and rename it as ".override.hcl"

locals {
  # On/Off - true if main config is to be overwritten with below parameters else branch name and account.hcl is used.
  override_active = true

  # Config name - Chose from below
  config = "testing"

  # Shared Lab Account
  testing = {
    account_name   = "testing"
    aws_account_id = "553688522943"
    aws_profile    = "leia-testing"
    bucket_suffix  = "" 
    
    parameters = {
      DOMAIN         = "test.leiarenee.io"
      DNS_ZONE_ID    = "Z0892705215W14M9I9W9N"
      CLUSTER        = "my-testing-k8s"
      CERTIFICATE    = "arn:aws:acm:eu-west-1:553688522943:certificate/431ea958-254b-4f8c-995f-a311559fcce5"
    }
  }






}