provider "aws" {
  region = "eu-central-1"
}

locals {
  sg_rules = [
    { port = 80, description = "Web Server" },
    { port = 443, description = "Web Server" },
    { port = 22, description = "SSH Access" }
  ]
}

resource "aws_security_group" "sg1" {
  name = "sg1"

  # create multiple "ingress" blocks
  dynamic "ingress" {
    # iterate over sg_rules
    for_each = local.sg_rules
    # for each sg_rule create "ingress" block with the following content:
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
