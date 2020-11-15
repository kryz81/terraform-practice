provider "aws" {
  region = "eu-central-1"
}

module "networking" {
  source = "./networking"
  # networking module requires vpc_id
  vpc_id = "vpc-08e20a48041c1f512"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
  subnet_id     = "subnet-0385e93d9292b4662"
  # get output from networking module and use it here
  vpc_security_group_ids = module.networking.security_groups
}
