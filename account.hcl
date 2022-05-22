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
        DOMAIN         = "testing.aws.leiarenee.io"
        DNS_ZONE_ID    = "Z0161485393JSLHK8QSEQ"
        CLUSTER        = "my-testing-k8s"
      }
    }

    # Application Staging
    staging = {
      account_name   = "staging"
      aws_account_id = "518854297938"
      aws_profile    = "leia-staging"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "staging.aws.leiarenee.io"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "my-staging-k8s"
      }
    }

    # Application Production 1
    production1 = {
      account_name   = "production1"
      aws_account_id = "009403416359"
      aws_profile    = "prod1"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "production1.aws.leiarenee.io"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "my-production1-k8s"
      }
    }
      
    # Application Production 2
    production2 = {
      account_name   = "production2"
      aws_account_id = "230794785515"
      aws_profile    = "prod2"
      bucket_suffix  = ""
      parameters = {
        DOMAIN         = "production2.aws.leiarenee.io"
        DNS_ZONE_ID    = "Z00140663TMWUSEB0C8DN"
        CLUSTER        = "my-production2-k8s"
      }
    }

    # Static
    static = {
      account_name   = "static"
      aws_account_id = "377449198785"
      aws_profile    = "static"
      bucket_suffix  = ""
      parameters = {

      }
    }

  }
}

