
terraform {
  source = "../../../modules/iam-policy"
  extra_arguments "common" {
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh",
      "destroy"
    ]
    required_var_files = ["${get_parent_terragrunt_dir()}/common.tfvars"]
  }
}
include {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../cloudfront", "../s3bucket"]
}
dependency "cloudfront" {
  config_path = "../cloudfront"
}

dependency "s3" {
  config_path = "../s3bucket"
}

inputs = {
  aws_cloudfront_distribution_arn = dependency.cloudfront.outputs.aws_cloudfront_distribution_arn
  bucket_id                       = dependency.s3.outputs.bucket_id
  bucket_arn                      = dependency.s3.outputs.bucket_arn
}