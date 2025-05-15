# bootstrap‑dev/variables.tf
variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "homelabs-dev"
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
  default     = "my-org-terraform-state-dev"
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-state-lock-dev"
}

variable "environment" {
  description = "Logical environment tag (e.g. dev, prod)"
  type        = string
  default     = "dev"
}
