# Terraform Bootstrap for Remote State

This repo provides a simple “bootstrap” that creates:

- An S3 bucket with versioning and server‑side encryption enabled for storing Terraform state
- A DynamoDB table for state locking

It uses a reusable Terraform module under **modules/bootstrap** and simple wrapper configs in:

- **bootstrap-dev/**  – for your dev environment
- **bootstrap-prod/** – for your prod environment

## Usage

1. **Clone the repo** and `cd terraform/`
2. **Create a feature branch** (e.g. `git checkout -b chore/bootstrap-remote-state-dev`)
3. **Edit** the wrapper in `bootstrap-dev/`:

   - `main.tf`: Point at the module, set backend `bucket`, `key`, `region`, `dynamodb_table`, `encrypt`
   - `variables.tf`: Declare `aws_region`, `aws_profile`, `state_bucket_name`, `lock_table_name`, `environment`
   - `outputs.tf`: (optional) surface the bucket & table names

4. **Initialize & apply** locally (you’ll keep state locally here until you’ve verified it):

   ```bash
   cd bootstrap-dev
   export AWS_PROFILE=homelabs-dev
   export AWS_REGION=us-east-1

   terraform init
   terraform apply \
     --var="state_bucket_name=my-org-terraform-state-dev" \
     --var="lock_table_name=terraform-state-lock-dev" \
     --var="environment=dev" \
     --auto-approve
