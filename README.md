# Terraform S3 module

## Requirements
Binary version ```v1.3.2```

## Providers

| Name | Version |
|------|---------|
| aws | 4.33.0 |


## How to
Set default configuration
```
module "s3" {
   source = "https://github.com/diego1277/terraform-module-s3.git"
   bucket_name = "s3-dso-terraform"
}
```
Enable CORS
```
module "s3" {
   source = "https://github.com/diego1277/terraform-module-s3.git"
   bucket_name = "s3-dso-terraform"
   cors_rules = {
     rule1 = {
       allowed_headers=["*"],
       allowed_methods=["GET"],
       allowed_origins=["https://mycustomdomain.com.br"]
     }
  }
}
```
Enable bucket lifecycle
```
module "s3" {
   source = "https://github.com/diego1277/terraform-module-s3.git"
   bucket_name = "s3-dso-terraform"
   bucket_object = {
     tmp = {
       name = "tmp"
       acl = "private"
     }
   }
   lifecycle_config = {
     rule1 = {
       id = "tmp",
       prefix = "tmp/",
       status = "Enabled"
       expiration_days = 120
    }
  }
}
```
Enable bucket lifecycle with transition
```
module "s3" {
   source = "https://github.com/diego1277/terraform-module-s3.git"
   bucket_name = "s3-dso-terraform"
   bucket_object = {
     tmp = {
       name = "tmp"
       acl = "private"
     }
   }
   lifecycle_config = {
     rule1 = {
       id = "tmp",
       prefix = "tmp/",
       status = "Enabled"
       expiration_days = 120
       transition = [{storage_class="STANDARD_IA",days=40},{storage_class="GLACIER",days=80}]
    }
  }
}
```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tags | additional tags | `map(any)` | `{}` | no |
| bucket\_name | bucket name | `string` | n/a | yes |
| bucket\_object | bucket objects | `map(object({name=string,acl=string}))` | `{}` | no |
| cors\_rules | core rules configs | `map(object({allowed_headers=list(string),allowed_methods=list(string),allowed_origins=list(string)}))` | `{}` | no |
| enable\_cors\_rules | enable cors rules | `bool` | `false` | no |
| lifecycle\_config | bucket lifecycle configs | <pre>map(object({id=string,prefix=string,status=string,expiration_days=optional(number,90)<br>                     transition=optional(list(object({days=number,storage_class=string})),[])}))</pre> | `{}` | no |
| security | default de secutiry | `string` | `"private"` | no |
| versioning | bucket versioning | `bool` | `false` | no |

## Outputs

No output.
## Author:
- `Diego Oliveira`
