variable "region" {
  type = string
}

variable "bucket_regional_domain_name" {
  type        = string
  description = "URL of origin S3 bucket including region"
}

variable "tags" {
  type = map(string)
}

variable "cloudfront_origin_name" {
  type        = string
  default     = "s3origin"
  description = "Naming for cloudfront origing"
}

variable "user_requests_enabled" {
  type        = bool
  default     = true
  description = "Whether the distribution is enabled to accept end user requests for content"
}

variable "is_ipv6_enabled" {
  type        = bool
  default     = true
  description = "Whether the IPv6 is enabled for the distribution"
}

variable "cloudfront_description" {
  type        = string
  default     = ""
  description = "Any comments you want to include about the distribution"
}

variable "default_cache_allowed_methods" {
  type = list(string)
  default = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin"
}

variable "default_cache_cached_methods" {
  type = list(string)
  default = ["GET", "HEAD"]
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods"
}

variable "default_forwarded_query_string" {
  type        = bool
  default     = false
  description = " Indicates whether you want CloudFront to forward query strings to the origin that is associated with this cache behavior"
}

variable "default_forwarded_cookies" {
  type        = string
  default     = "none"
  description = "Whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior"
}

variable "default_viewer_protocol_policy" {
  type        = string
  default     = "allow-all"
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern"
}

variable "default_ttl" {
  type = map(string)
  default = {
    "min_ttl" : 0,
    "default_ttl" : 3600,
    "max_ttl" : 86400
  }
  description = "TTL of cache"
}

variable "price_class" {
  type        = string
  default     = "PriceClass_200"
  description = "Price class for this distribution"
}

variable "geo_restriction_type" {
  type        = string
  default     = "none"
  description = "Type of geolocation filtering"
}

variable "geo_restriction_list" {
  type        = list(string)
  default     = []
  description = "List of geolocations to block requests"
}

variable "use_cloudfront_default_certificate" {
  type        = bool
  default     = true
  description = "Whether to use the default cloudfront certificate"
}

variable "cloudfront_origin_access_control_name" {
  type        = string
  description = "Name of access control defined for cloudfront"
}

variable "cloudfront_oa_description" {
  type        = string
  description = "Origin description origin allowed access to the s3"
  default     = "Cloudfront origin allowed access to the s3 bucket"
}

variable "cloudfront_access_signing_behavior" {
  type        = string
  description = "Specifies which requests CloudFront signs"
  default     = "always"
}
