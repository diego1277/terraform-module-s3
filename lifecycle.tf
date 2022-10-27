resource "aws_s3_bucket_lifecycle_configuration" "this" {
  for_each = length(keys(var.lifecycle_config)) > 0 ? var.lifecycle_config : {}
  bucket = aws_s3_bucket.this.id

  dynamic "rule" {
    for_each = var.lifecycle_config
      content {
        id = rule.value.id

        filter {
           prefix = rule.value.prefix
    
        }
       
        expiration {
           days = rule.value.expiration_days
        }

        status = rule.value.status

     dynamic "transition" {
        for_each = length(var.lifecycle_config[rule.key]["transition"]) > 0 ? var.lifecycle_config[rule.key]["transition"] : []
          content {
            days          = transition.value.days
            storage_class = transition.value.storage_class
          }
       }
    }
  }
}
