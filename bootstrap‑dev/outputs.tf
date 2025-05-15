# bootstrap‑dev/outputs.tf
output "state_bucket" {
  value       = module.bootstrap.state_bucket
  description = "The S3 bucket for Terraform state (dev)"
}

output "lock_table" {
  value       = module.bootstrap.lock_table
  description = "The DynamoDB lock table name (dev)"
}
