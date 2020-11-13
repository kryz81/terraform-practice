terraform {
  required_providers {
    aws = "~>3.14"
  }
}

provider "aws" {
  region = "eu-central-1"
  alias  = "eu"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us"
}

resource "aws_instance" "ec2-eu" {
  ami           = "ami-0c960b947cbb2dd16"
  instance_type = "t2.micro"
  provider      = aws.eu
}

resource "aws_instance" "ec2-us" {
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  provider      = aws.us
}
