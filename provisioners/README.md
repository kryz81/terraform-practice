## Provisioners

**Use local provisioner to exec command locally (host machine with terraform)**

```hcl-terraform
resource "aws_instance" "myinstance" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"

  provisioner "local-exec" {
    command = "echo $PAGER, ${self.public_ip}"
  }
}

```
