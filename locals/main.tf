provider "aws" {
  region = "eu-central-1"
}

locals {
  env = "dev"
}

resource "aws_security_group" "http" {
  name = "${local.env}-sg"

  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource aws_instance "myinstance" {
  ami                    = "ami-0c960b947cbb2dd16"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http.id]
  tags = {
    Name = "${local.env}-ec2"
  }
}
