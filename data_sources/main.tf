provider "aws" {
  region = "eu-central-1"
}

data "aws_vpc" "web" {
  id = "vpc-0ac07b47cb305021f"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = [099720109477]
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
}

output "web_vpc_id" {
  description = "CIDR block of web vpc"
  value       = data.aws_vpc.web.cidr_block
}
