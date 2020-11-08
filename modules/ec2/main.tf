resource "aws_instance" "instance" {
  ami = var.instance_image
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}
