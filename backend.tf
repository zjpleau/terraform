terraform {
  backend "s3" {
    bucket  = "my-tf-state-homelabs-dev"
    key     = "homelabs-dev/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true

    # state‐locking in DDB
    dynamodb_table = "my-tf-state-locks-homelabs-dev"

    # which AWS profile to use
    profile = "homelabs-dev"
  }
}
