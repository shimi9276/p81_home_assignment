

resource "aws_cloudfront_origin_access_control" "cloudfront_access" {
  name                              = var.cloudfront_origin_access_control_name
  description                       = var.cloudfront_oa_description
  origin_access_control_origin_type = "s3"
  signing_behavior                  = var.cloudfront_access_signing_behavior
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "cloudfront_distro" {
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_access.id
    origin_id                = var.cloudfront_origin_name
  }

  enabled         = var.user_requests_enabled
  is_ipv6_enabled = var.is_ipv6_enabled
  comment         = var.cloudfront_description

  default_cache_behavior {
    allowed_methods  = var.default_cache_allowed_methods
    cached_methods   = var.default_cache_cached_methods
    target_origin_id = var.cloudfront_origin_name

    forwarded_values {
      query_string = var.default_forwarded_query_string

      cookies {
        forward = var.default_forwarded_cookies
      }
    }

    viewer_protocol_policy = var.default_viewer_protocol_policy
    min_ttl                = var.default_ttl["min_ttl"]
    default_ttl            = var.default_ttl["default_ttl"]
    max_ttl                = var.default_ttl["max_ttl"]
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
      locations        = var.geo_restriction_list
    }
  }

  tags = var.tags

  viewer_certificate {
    cloudfront_default_certificate = var.use_cloudfront_default_certificate
  }
}