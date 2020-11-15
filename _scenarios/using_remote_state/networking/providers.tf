provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "kryz-remote-terraform-state-files"
    key    = "networking.tf"
    region = "eu-central-1"
  }
}
