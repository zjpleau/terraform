# Create the S3 bucket
resource "aws_s3_bucket" "tfstate" {
  bucket = var.state_bucket_name
  acl    = "private"

  tags = {
    Name        = var.state_bucket_name
    Environment = "dev"
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enforce SSE‑S3 encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB table for state locks
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
    Environment = "dev"
  }
}
