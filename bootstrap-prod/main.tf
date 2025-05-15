terraform {
  backend "s3" {
    bucket         = "my-org-terraform-state-prod"
    key            = "bootstrap-prod/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

module "bootstrap" {
  source           = "../modules/bootstrap"
  state_bucket_name = var.state_bucket_name
  lock_table_name   = var.lock_table_name
  environment       = var.environment
}
