
terraform {
  source = "../../../modules/cloudfront"
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
  paths = ["../s3bucket"]
}
dependency "s3" {
  config_path = "../s3bucket"
}

inputs = {
  bucket_regional_domain_name = dependency.s3.outputs.bucket_regional_domain_name,
}