## Modules

**Download and update modules**

```shell script
terraform get
```

**Use remote module**

```hcl-terraform
module "vpc" {
  # set remote source
  source = "terraform-aws-modules/vpc/aws"
  # define module version
  version = "2.21.0"
  
  # set variables required by module
  name = "My VPC"
  cidr = "0.0.0.0/0"
}
```

**Use local module**

```hcl-terraform
module "aws" {
  source = "./ec2"
  instance_image = "t2.nano"
}
```

**Use output from module**

```hcl-terraform
output "publicip" {
  value = module.ec2.publicicp
}
```
