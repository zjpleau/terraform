// modules/bootstrap/main.tf

resource "aws_s3_bucket" "tfstate" {
  bucket = var.state_bucket_name
  acl    = "private"

  # Don’t attempt to change the ACL on this bucket
  lifecycle {
    ignore_changes = [acl]
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  versioning {
    enabled = true
  }

  tags = {
    Environment = var.environment
    Name        = var.state_bucket_name
  }
}

=======
# modules/bootstrap/main.tf
# Create the S3 bucket for remote state
resource "aws_s3_bucket" "tfstate" {
  bucket = var.state_bucket_name

  tags = {
    Name        = var.state_bucket_name
    Environment = var.environment
  }
}

# Enable versioning on the bucket
resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enforce server‑side encryption (AES256)
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "lock" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Environment = var.environment
    Name        = var.lock_table_name
=======
    Name        = var.lock_table_name
    Environment = var.environment
  }
}
