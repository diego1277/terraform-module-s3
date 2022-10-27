resource "aws_s3_object" "this" {
  for_each = length(keys(var.bucket_object)) > 0 ? var.bucket_object : {}
  key        = each.value["name"]
  acl = each.value["acl"]
  bucket     = aws_s3_bucket.this.id
  tags = local.common_tags
}
