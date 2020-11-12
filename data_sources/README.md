## Data sources

**Get data of existing resource (without creating it)

```hcl-terraform
data "aws_vpc" "web" {
  id = "vpc-0ac07b47cb305021f"
}

output "web_vpc_id" {
  description = "CIDR block of web vpc"
  value       = data.aws_vpc.web.cidr_block
}
```
