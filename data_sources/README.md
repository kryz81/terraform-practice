## Data sources

**Get data of existing resource (without creating it)

```hcl-terraform
data "aws_vpc" "web" {
  filter {
    name    = "tag:Name"
    values  = ["web"]
  }
}

```

**User regex to find resource**

```hcl-terraform
data "aws_vpc" "web" {
  filter {
    name    = "tag:Name"
    values  = ["/web/"]
    regex   = true
  }
}
```
