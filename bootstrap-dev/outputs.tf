# bootstrap-dev/outputs.tf

output "state_bucket" {
  description = "The S3 bucket for Terraform state (dev)"
  value       = module.bootstrap.state_bucket
}

output "lock_table" {
  description = "The DynamoDB lock table (dev)"
  value       = module.bootstrap.lock_table
}
