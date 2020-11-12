## Providers

**Create two providers of the same type using alias**

```hcl-terraform
provider "aws" {
  # default provider, alias skipped
  region = "eu-central-1"
}

provider "aws" {
  region = "us-east-1"
  # provider with alias
  alias = "us"
}
```

**Use alias to create resource with specified provider**

```hcl-terraform
resource "aws_instance" "ec2-eu" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = "t2.micro"
  # provider has alias = "eu"
  provider = aws.eu
}
```
