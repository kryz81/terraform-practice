resource "aws_security_group" "sg1_web" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    protocol    = "TCP"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  name = "sg1_web"
}

resource "aws_security_group" "sg1_ssh" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  name = "sg1_ssh"
}
