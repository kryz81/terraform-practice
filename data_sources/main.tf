provider "aws" {
  region = "eu-central-1"
}

data "aws_vpc" "web" {
  filter {
    name    = "tag:Name"
    values  = ["web"]
  }
}

output "web_vpc_id" {
  description = "CIDR block of web vpc"
  value       = data.aws_vpc.web.cidr_block
}
