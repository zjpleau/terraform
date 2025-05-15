# bootstrap‑prod/outputs.tf
output "state_bucket" {
  value       = module.bootstrap.state_bucket
  description = "The S3 bucket for Terraform state (prod)"
}

output "lock_table" {
  value       = module.bootstrap.lock_table
  description = "The DynamoDB lock table name (prod)"
}
