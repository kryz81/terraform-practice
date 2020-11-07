terraform {
  backend "s3" {
    region = "eu-central-1"
    bucket = "kryz-terraform-config"
    key = "global/s3/terraform.tfstate"
    dynamodb_table = "terraform_config_lock"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_s3_bucket" "remote_backend" {
  # where to store terraform state
  bucket = "kryz-terraform-config"

  # prevent removing bucket
  lifecycle {
    prevent_destroy = true
  }

  # use versioning
  versioning {
    enabled = true
  }

  # encrypt content
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_config_lock" {
  hash_key = "LockID"
  name = "terraform_config_lock"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}
