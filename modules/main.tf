provider "aws" {
  region = "eu-central-1"
}

module "ec2" {
  source         = "./ec2"
  instance_image = "ami-0c960b947cbb2dd16"
  instance_type  = "t2.nano"
}

output "publicip" {
  value = module.ec2.public_ip
}
