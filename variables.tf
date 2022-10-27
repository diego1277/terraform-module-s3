variable bucket_name {
    description = "bucket name"
    type = string
}
variable versioning {
    description = "bucket versioning"
    type = bool
    default = false
}
variable security {
    description = "default de secutiry"
    type = string 
    default = "private"
}
variable bucket_object {
  description = "bucket objects"
  type        = map(object({name=string,acl=string}))
  default     = {}
}
variable enable_cors_rules {
  description = "enable cors rules"
  type        = bool
  default     = false
}
variable cors_rules {
  description = "core rules configs"
  type = map(object({allowed_headers=list(string),allowed_methods=list(string),allowed_origins=list(string)}))
  default = {}
}
variable additional_tags {
  description = "additional tags"
  type = map(any)
  default = {}
}
variable common_tags {
  description = "common tags"
  type = map(any)
  default = {
    service = "s3"
  }
}
variable lifecycle_config {
  description = "bucket lifecycle configs"
  type = map(object({id=string,prefix=string,status=string,expiration_days=optional(number,90)
                     transition=optional(list(object({days=number,storage_class=string})),[])}))
  default     = {}
}
