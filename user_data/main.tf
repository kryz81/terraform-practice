provider "aws" {
  region = "eu-central-1"
}

data aws_vpc "vpc" {
  id = "vpc-08e20a48041c1f512"
}

resource "aws_subnet" "subnet" {
  cidr_block        = cidrsubnet(data.aws_vpc.vpc.cidr_block, 4, 1)
  vpc_id            = data.aws_vpc.vpc.id
  availability_zone = "eu-central-1c"
}

resource "aws_security_group" "http" {
  vpc_id = data.aws_vpc.vpc.id
  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ssh" {
  vpc_id = data.aws_vpc.vpc.id
  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource aws_instance "myinstance" {
  subnet_id              = aws_subnet.subnet.id
  associate_public_ip_address = true
  ami                    = "ami-0c960b947cbb2dd16"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.http.id, aws_security_group.ssh.id]
  user_data              = <<-DOC
    #!/bin/bash

    sudo apt-get update
    sudo apt-get install -y apache2

    sudo systemctl start apache2
    sudo systemctl enable apache2

    echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
  DOC
}

output "public_ip" {
  value = aws_instance.myinstance.public_ip
}
