
terraform {
  source = "../../../modules/s3bucket"
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


