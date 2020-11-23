terraform {
  backend "s3" {
    bucket         = "kryz-terraform-config-workspaces"
    key            = "workspaces-example/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform_config_workspaces_lock"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0c960b947cbb2dd16"
  instance_type = terraform.workspace == "default" ? "t2.nano" : "t2.micro"
}

resource "aws_s3_bucket" "remote_backend" {
  # where to store terraform state
  bucket = "kryz-terraform-config-workspaces"

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
  hash_key     = "LockID"
  name         = "terraform_config_workspaces_lock"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
}

output "myinstance_type" {
  value = aws_instance.myinstance.instance_type
}
