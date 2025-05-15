output "state_bucket" {
  description = "Name of the S3 bucket created for Terraform remote state"
  value       = module.bootstrap.state_bucket
}

output "lock_table" {
  description = "Name of the DynamoDB table created for Terraform state locking"
  value       = module.bootstrap.lock_table
}
