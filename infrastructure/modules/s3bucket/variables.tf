variable "region" {
  type        = string
  description = "Region in which to provision the resources"
}

variable "bucket_name" {
  type        = string
  description = "Name of S3 bucket"
}

variable "tags" {
  type        = map(string)
  description = "Tags to add to the s3 resource"
}

variable "force_destroy" {
  type        = bool
  description = "Should all the objects in the bucket be force deleted during the deletion of the bucket"
  default     = false
}

