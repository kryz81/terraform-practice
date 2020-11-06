provider "aws" {
  region = "eu-central-1"
  profile = "default"
}

variable "ami" {
  type = string
  default = "ami-00a205cb8e06c3c4e"
}

variable "port" {
  type = number
  default = 3000
}

resource "aws_security_group" "mysg" {
  ingress {
    from_port = var.port
    protocol = "TCP"
    to_port = var.port
  }
  egress {
    from_port = var.port
    protocol = "TCP"
    to_port = var.port
  }
}

resource "aws_instance" "myinstance" {
  ami = var.ami
  instance_type = "t2.micro"
  security_groups = []
}
