provider "aws" {
  allowed_account_ids = var.account_numbers
  region              = var.region
  profile             = var.aws_profile
}