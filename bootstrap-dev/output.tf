output "state_bucket" {
  value       = module.bootstrap.state_bucket
  description = "Name of the S3 bucket for remote state (dev)"
}

output "lock_table" {
  value       = module.bootstrap.lock_table
  description = "Name of the DynamoDB table for state locking (dev)"
}
