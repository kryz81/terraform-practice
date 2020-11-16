provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}

variable "ami" {
  type    = string
  default = "ami-0c960b947cbb2dd16"
}

variable "http_port" {
  type    = number
  default = 80
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "mytuple" {
  type    = tuple([string, number, bool])
  default = ["Test", 39, true]
}

variable "hello_message" {
  type    = string
  default = "Hello from Terraform!"
}

resource "aws_security_group" "server" {
  ingress {
    from_port   = var.http_port
    protocol    = "TCP"
    to_port     = var.http_port
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = var.http_port
    protocol    = "TCP"
    to_port     = var.http_port
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ssh" {
  ingress {
    from_port   = var.ssh_port
    protocol    = "TCP"
    to_port     = var.ssh_port
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = var.ssh_port
    protocol    = "TCP"
    to_port     = var.ssh_port
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myinstance" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.server.id, aws_security_group.ssh.id]
  user_data              = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    echo ${var.hello_message} > /usr/share/nginx/html/index.html
    sudo service nginx restart
EOF
}

output "myip" {
  value = aws_instance.myinstance.public_ip
}
