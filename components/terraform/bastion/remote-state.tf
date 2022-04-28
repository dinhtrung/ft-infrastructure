#module "vpc" {
#  source  = "cloudposse/stack-config/yaml//modules/remote-state"
#  version = "0.17.0"
#
#  stack_config_local_path = "../../../stacks"
#  component               = "vpc"
#
#  context = module.this.context
#}

data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = "ft-ue2-devel" # terraform.workspace

  config = {
    encrypt              = true
    bucket               = "ft-ue2-devel-tfstate"
    dynamodb_table       = "ft-ue2-devel-tfstate-lock"
    workspace_key_prefix = "vpc"
    key                  = "terraform.tfstate"
    region               = var.region
    acl                  = "bucket-owner-full-control"
  }
}