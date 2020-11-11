provider "aws" {
  region = "eu-central-1"
}

resource "aws_vpc" "vpc1" {
  cidr_block = "90.0.0.0/16"
  tags = {
    Name : "vpc1"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block = "90.0.1.0/24"
  vpc_id     = aws_vpc.vpc1.id
  depends_on = [aws_vpc.vpc1]
}

output "myoutput" {
  value = aws_vpc.vpc1.tags.Name
}
