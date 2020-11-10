## Provisioners

**Use local provisioner to exec command locally (host machine with terraform)**

```hcl-terraform
resource "aws_instance" "myinstance" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"

  provisioner "local-exec" {
    # to refer to parent use "self", not name
    command = "echo $PAGER, ${self.public_ip}"
  }
  
  # run only on destroy
  provisioner "local-exec" {
    command = "echo 'Destroying...'"
    when = destroy
    # continue even if this provisioner fails
    on_failure = continue
  }
}
```

**Use remote provisioner to run script on created machine**

```hcl-terraform
resource "aws_instance" "myinstance" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
  
  provisioner "remote-exec" {
    # copy and run script on remote machine
    script = "./run.sh"
    
    # we need connection to run on remote machine
    connection {
        type     = "ssh"
        user     = "root"
        password = "${var.root_password}"
        host     = "${var.host}"
    }
  }
  
  provisioner "remote-exec" {
    # run inline commands on remote machine
    inline = [
      "echo 'Hello'",
      "date"
    ]
  }
 }
```

**Use file provisioner to copy files to created machine**

```hcl-terraform
resource "aws_instance" "myinstance" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
  
  provisioner "file" {
    # copy file
    source = "my.conf"
    destination = "/etc/my.conf"
  }
  
  provisioner "file" {
    # insert content into file
    content = "ami used: ${self.ami}"
    destination = "/home/ubuntu/ami.txt"
  }
}
```
