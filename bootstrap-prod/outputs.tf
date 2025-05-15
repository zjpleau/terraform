# bootstrap-prod/outputs.tf

output "state_bucket" {
  description = "The S3 bucket for Terraform state (prod)"
  value       = module.bootstrap.state_bucket
}

output "lock_table" {
  description = "The DynamoDB lock table (prod)"
  value       = module.bootstrap.lock_table
}
