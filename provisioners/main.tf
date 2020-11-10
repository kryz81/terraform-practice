provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "myinstance" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"

  provisioner "local-exec" {
    command = "echo $PAGER, ${self.public_ip}"
  }
}
