resource "aws_s3_bucket_cors_configuration" "this" {
  count = length(keys(var.cors_rules)) > 0 ? 1 : 0
  bucket = aws_s3_bucket.this.id

  dynamic "cors_rule" {
   for_each = var.cors_rules
     content {
       allowed_headers = cors_rule.value.allowed_headers
       allowed_methods = cors_rule.value.allowed_methods
       allowed_origins = cors_rule.value.allowed_origins
      }
   }
}
