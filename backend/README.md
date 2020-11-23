## Backend

**Set remote backend**

```hcl-terraform
terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "kryz-terraform-config"
    key = "global/s3/terraform.tfstate"
  }
}
```
