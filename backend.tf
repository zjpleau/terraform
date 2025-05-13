terraform {
  backend "s3" {
    bucket         = "my-tf-state-homelabs-dev"
    key            = "homelabs-dev/terraform.tfstate"
    region         = "us-east-1"

    # enable the new locking mechanism (replaces the old `dynamodb_table`‑only workflow)
    use_lockfile   = true

    # still specify your DynamoDB table so Terraform will write locks there
    dynamodb_table = "my-tf-state-locks-homelabs-dev"

    encrypt        = true

    # make sure this matches exactly the [profile homelabs-dev] stanza in ~/.aws/config
    profile        = "homelabs-dev"
  }
}
