variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile name for this account"
  default     = "homelabs-dev"
}

variable "state_bucket_name" {
  type        = string
  description = "Name of the S3 bucket for Terraform remote state"
}

variable "lock_table_name" {
  type        = string
  description = "Name of the DynamoDB table for state locking"
}
