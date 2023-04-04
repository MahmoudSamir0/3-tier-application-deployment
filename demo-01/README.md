# terraform-aws-remote-state-s3-backend

A terraform module to set up [remote state management](https://www.terraform.io/docs/state/remote.html) with [S3 backend](https://www.terraform.io/docs/backends/types/s3.html) for your account. It creates an encrypted S3 bucket to store state files and a DynamoDB table for state locking and consistency checking.
Resources are defined following best practices as described in [the official document](https://www.terraform.io/docs/backends/types/s3.html#multi-account-aws-architecture)

  ## Initialize the directory

When you create a new configuration — or check out an existing configuration
from version control — you need to initialize the directory with `terraform
init`. This step downloads the providers defined in the configuration.
