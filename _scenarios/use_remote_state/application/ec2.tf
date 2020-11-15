resource "aws_instance" "myec2" {
  ami                    = "ami-0c960b947cbb2dd16"
  instance_type          = "t2.nano"
  subnet_id              = "subnet-0385e93d9292b4662"
  vpc_security_group_ids = data.terraform_remote_state.networking.outputs.security_groups
}
