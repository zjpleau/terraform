# bootstrap‑dev/main.tf
terraform {
  backend "s3" {
    bucket         = "my-org-terraform-state-dev"
    key            = "bootstrap‑dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dev"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "bootstrap" {
  source            = "../modules/bootstrap"
  state_bucket_name = var.state_bucket_name
  lock_table_name   = var.lock_table_name
  environment       = var.environment
}
