resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
  tags = local.common_tags
}
