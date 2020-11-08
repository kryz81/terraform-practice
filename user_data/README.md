## User data

**Use heredoc to add user data content**

```hcl-terraform
resource aws_instance "myinstance" {
  ami                    = "ami-0c960b947cbb2dd16"
  instance_type          = "t2.micro"
  user_data              = <<-DOC
    #!/bin/bash

    sudo apt-get update
    sudo apt-get install -y apache2

    sudo systemctl start apache2
    sudo systemctl enable apache2

    echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
  DOC
}
```

**Use file function to pass file content to user data**

```hcl-terraform
resource aws_instance "myinstance" {
  ami                    = "ami-0c960b947cbb2dd16"
  instance_type          = "t2.micro"
  user_data              = file("www.sh")
}
```
