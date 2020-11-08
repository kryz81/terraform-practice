provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
  vpc_security_group_ids = [aws_security_group.sg.id]
}

resource "aws_security_group" "sg" {

  ingress {
    from_port = 80
    protocol = "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "ec2_publicip" {
  value       = aws_instance.ec2.public_ip
  description = "Public IP"
  sensitive   = false
  depends_on = [
    aws_security_group.sg.id
  ]
}
