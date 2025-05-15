// modules/bootstrap/outputs.tf
output "state_bucket" {
  description = "The name of the S3 bucket used for Terraform state"
=======
output "state_bucket" {
  description = "Name of the S3 bucket created for Terraform remote state"
  value       = aws_s3_bucket.tfstate.bucket
}

output "lock_table" {
  description = "The name of the DynamoDB table used for state locking"
=======
  description = "Name of the DynamoDB table created for Terraform state locking"
  value       = aws_dynamodb_table.lock.name
}
