output "bucket_regional_domain_name" {
  value = aws_s3_bucket.content_bucket.bucket_regional_domain_name
}
output "bucket_arn" {
  value = aws_s3_bucket.content_bucket.arn
}
output "bucket_id" {
  value = aws_s3_bucket.content_bucket.id
}
output "bucket_domain_name" {
  value = aws_s3_bucket.content_bucket.bucket_domain_name
}
output "region" {
  value = aws_s3_bucket.content_bucket.region
}
output "tags" {
  value = aws_s3_bucket.content_bucket.tags_all
}
