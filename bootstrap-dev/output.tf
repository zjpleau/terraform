output "state_bucket" {
  value       = module.bootstrap.state_bucket
  description = "The name of the S3 bucket used for Terraform state"
}

output "lock_table" {
  value       = module.bootstrap.lock_table
  description = "The name of the DynamoDB table used for state locking"
}
