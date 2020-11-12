provider "aws" {
  region = "eu-central-1"
}

data "terraform_remote_state" "networking" {
  backend = "s3"
  config {
    bucket = "s3://remote-terraform-state-files/networking.tf"
    key = "networking.tf"
    region = "eu-central-1"
  }
}

resource "aws_subnet" "ec2" {
  # use value from another terraform state stored in a s3 bucket
  vpc_id = data.terraform_remote_state.networking.outputs.myvpc
  cidr_block = "0.0.0.0/0"
}

