terraform {
  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "my-org-terraform-state-dev"     # ← your new dev bucket
    key            = "root/terraform.tfstate"        # ← store state under this key
    region         = "us-east-1"
    encrypt        = true
    # (if you still want locking:)  
    # use_lockfile = false         # ← S3 lockfile (optional)
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

# …all your regular modules/resources below…
