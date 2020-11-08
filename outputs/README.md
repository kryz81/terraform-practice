## Outputs

**Create output**

```hcl-terraform
resource "aws_instance" "ec2" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
}

output "ec2_publicip" {
  # get public ip of create ec2 instance
  value = aws_instance.ec2.public_ip
  
  # optional description
  description = "Public IP"
  
  # whether to supress CLI output
  sensitive = false
}
```
