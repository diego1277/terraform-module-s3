locals {
  common_tags = merge(var.additional_tags,var.common_tags)
}
