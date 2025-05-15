// modules/bootstrap/main.tf

variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform remote state"
  type        = string
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
}

variable "environment" {
  description = "Logical environment tag (e.g. dev, prod)"
  type        = string
}

resource "aws_s3_bucket" "tfstate" {
  bucket = var.state_bucket_name

  # Enable versioning
  versioning {
    enabled = true
  }

  # Enforce AES-256 encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = var.state_bucket_name
    Environment = var.environment
  }

  # Ignore ACL changes since our org buckets disable ACLs
  lifecycle {
    ignore_changes = [acl]
  }
}

resource "aws_dynamodb_table" "lock" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = var.lock_table_name
    Environment = var.environment
  }
}
