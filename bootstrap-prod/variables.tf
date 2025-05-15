variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile to use"
  default     = "homelabs-prod"
}

variable "state_bucket_name" {
  type        = string
  description = "Name of the Terraform state S3 bucket"
  default     = "my-org-terraform-state-prod"
}

variable "lock_table_name" {
  type        = string
  description = "Name of the DynamoDB table for state locking"
  default     = "terraform-state-lock-prod"
}

variable "environment" {
  type        = string
  description = "Logical environment tag (e.g. dev, prod)"
  default     = "prod"
}
