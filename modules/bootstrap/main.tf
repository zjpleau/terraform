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
  }
}
