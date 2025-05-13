terraform {
  backend "s3" {
    bucket         = "my-tf-state-homelabs-dev"
    key            = "homelabs-dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "my-tf-state-locks-homelabs-dev"
    encrypt        = true
  }
}
