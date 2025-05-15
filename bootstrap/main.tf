terraform {
  required_version = ">= 1.0"

  backend "s3" {
    # these will get overridden by -backend-config on init:
    bucket         = var.state_bucket_name
    key            = "bootstrap/terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = var.lock_table_name
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
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
