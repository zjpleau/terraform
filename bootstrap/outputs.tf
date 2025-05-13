output "state_bucket" {
  description = "Name of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.tfstate.bucket
}

output "lock_table" {
  description = "Name of the DynamoDB table for state locking"
  value       = aws_dynamodb_table.lock.name
}
