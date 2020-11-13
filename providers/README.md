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

**Restrict all provider blocks to specific provider version**

```hcl-terraform
terraform {
  required_providers {
    aws = "~>3.14.1"
  }
}
```

**Enable providers (plugins) caching to avoid fetching the same plugin multiple times**

```shell script
TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache" terraform init

# or in config file:
# plugin_cache_dir   = "$HOME/.terraform.d/plugin-cache"
```
