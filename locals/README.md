## Locals (local variables)

**Create and use a local variable**

```hcl-terraform
locals {
  env = "dev"
}

resource "aws_security_group" "http" {
  name = "${local.env}-sg"
}
```
