variable "region" {
  type = string
  description = "Region in which to deply the resources"
}

variable "tags" {
  type        = map(string)
  description = "Tags to add to the s3 resource"
}

variable "bucket_id" {
  type = string
  description = "Bucket id of which to attach the role"
}

variable "bucket_arn" {
  type = string
  description = "Bucket id of which to attach the role"
}

variable "aws_cloudfront_distribution_arn" {
  type = string
  description = "Cloud Front Distro Arn"
}
