data "terraform_remote_state" "sso" {
  backend   = "s3"
#  workspace = format("%s-%s", var.sso_environment_name, var.sso_stage_name)
  workspace = "mgmt-gbl-root"
  config = {
    encrypt              = true
    bucket               = "mgmt-gbl-root-tfstate" # local.tfstate_bucket
    workspace_key_prefix = "sso"
    key                  = "terraform.tfstate"
    dynamodb_table       = "mgmt-gbl-root-tfstate-lock" # local.tfstate_dynamodb_table
    region               = "us-east-2" # var.region
#    role_arn             = "null" # local.tfstate_access_role_arn
    acl                  = "bucket-owner-full-control"
  }
}

data "terraform_remote_state" "account_map" {
  backend   = "s3"
#  workspace = format("%s-%s", var.account_map_environment_name, var.account_map_stage_name)
  workspace = "mgmt-gbl-root"
  config = {
    encrypt              = true
    bucket               = "mgmt-gbl-root-tfstate" # local.tfstate_bucket
    workspace_key_prefix = "account-map"
    key                  = "terraform.tfstate"
    dynamodb_table       = "mgmt-gbl-root-tfstate-lock" # local.tfstate_dynamodb_table
    region               = "us-east-2" # var.region
#    role_arn             = "null" # local.tfstate_access_role_arn
    acl                  = "bucket-owner-full-control"
  }
}
