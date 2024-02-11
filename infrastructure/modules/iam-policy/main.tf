
resource "aws_s3_bucket_policy" "iam_policy" {
  bucket = var.bucket_id
  policy = data.aws_iam_policy_document.cloudfront_access.json
}