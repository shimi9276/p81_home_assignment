

resource "aws_s3_bucket" "content_bucket" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags          = var.tags
}
