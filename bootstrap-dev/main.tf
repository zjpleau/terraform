terraform {
  backend "s3" {
    bucket         = var.state_bucket_name
    key            = "bootstrap-dev/terraform.tfstate"
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
  source             = "../modules/bootstrap"
  state_bucket_name  = var.state_bucket_name
  lock_table_name    = var.lock_table_name
  environment        = var.environment
}
