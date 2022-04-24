# Set account-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  branch = {
    # ------- Application ----------

    # Application Testing
    testing = {
      account_name   = "testing"
      aws_account_id = "553688522943"
      aws_profile    = "testing"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "staging.dev"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "testing-cluster"
      }
    }

    # Application Staging
    staging = {
      account_name   = "staging"
      aws_account_id = "518854297938"
      aws_profile    = "staging"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "staging.dev"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "staging-cluster"
      }
    }

    # Application Production 1
    production1 = {
      account_name   = "production1"
      aws_account_id = "009403416359"
      aws_profile    = "prod1"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "prod1.dev"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "production1-cluster"
      }
    }
      
    # Application Production 2
    production2 = {
      account_name   = "production2"
      aws_account_id = "230794785515"
      aws_profile    = "prod2"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "prod2.dev"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "production2-cluster"
      }
    }
  }
}

