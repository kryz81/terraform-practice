terraform {
  required_providers {
    aws = "~>3"
  }
}

provider "aws" {
  region = "eu-central-1"
}

variable "instance" {
  type = any
  default = [
    {
      device_name = "sda1"
      volume_size = 1
    },
    {
      device_name = "sda2"
      volume_size = 1
    }
  ]
}

output "device_names" {
  value = var.instance[*].device_name
}

output "uppercase_device_names" {
  value = [for device in var.instance : upper(device.device_name)]
}

output "device_names2" {
  value = { for device_name in var.instance[*].device_name : device_name => upper(device_name) }
}

resource "aws_iam_user" "user_accounts" {
  for_each = toset(["Todd", "James"])
  name     = each.key
}
