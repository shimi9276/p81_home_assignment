
remote_state {
  backend = "s3"
  generate = {
    path      = "_backend.tf"
    if_exists = "overwrite"
  }

  config = {
    bucket  = "p81-tfstates-shimi"
    key     = "${basename(get_terragrunt_dir())}/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

generate "aws_provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
    terraform {
        required_providers {
            aws = {
                source  = "hashicorp/aws"
                version = "~> 5.0"
                }
            }
        }
    provider "aws" {
    region = var.region
    }
EOF
}

inputs = {
  bucket_name                           = "p81-content-bucket-shimi"
  cloudfront_origin_access_control_name = "cloudfront-access-s3"
  cloudfront_description                = "p81-home-assignment-ShimiW"
}

