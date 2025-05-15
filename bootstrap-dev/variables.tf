variable "aws_region" {
  description = "AWS region to use"
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "homelabs-dev"
}

variable "state_bucket_name" {
  description = "Name of S3 bucket for Terraform state"
  type        = string
}

variable "lock_table_name" {
  description = "Name of DynamoDB table for state locking"
  type        = string
}

variable "environment" {
  description = "Logical environment tag (e.g. dev, prod)"
  type        = string
}
