// modules/bootstrap/outputs.tf
output "state_bucket" {
  description = "The name of the S3 bucket used for Terraform state"
  value       = aws_s3_bucket.tfstate.bucket
}

output "lock_table" {
  description = "The name of the DynamoDB table used for state locking"
  value       = aws_dynamodb_table.lock.name
}
