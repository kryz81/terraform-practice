provider "aws" {
  region = "eu-central-1"
}

data "aws_vpc" "web" {
  id = "vpc-0ac07b47cb305021f"
}

output "web_vpc_id" {
  description = "CIDR block of web vpc"
  value       = data.aws_vpc.web.cidr_block
}
