provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0c960b947cbb2dd16"
  instance_type = terraform.workspace == "default" ? "t2.nano" : "t2.micro"
  tags = {
    Name = "Workspace: ${terraform.workspace}"
  }
}
