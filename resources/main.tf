provider "aws" {
  region = "eu-central-1"
}

resource aws_instance "web_server" {
  # create 3 ec2 instances
  count = 3

  tags = {
    # get current count index
    Name = "myinstance-${count.index}"
  }

  ami           = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
}
