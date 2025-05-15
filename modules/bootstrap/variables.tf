// modules/bootstrap/variables.tf
variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
=======
variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform remote state"
  type        = string
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table for state locking"
=======
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
}

variable "environment" {
  description = "Logical environment tag (e.g. dev, prod)"
=======
  description = "Environment tag (e.g. dev, prod)"
  type        = string
}
