## Loops

**Get specific attribute values from multiple blocks**

```hcl-terraform
variable "instance" {
  type = any
  default = [
    {
      device_name = "sda1"
      volume_size = 1
    },
    {
      device_name = "sda2"
      volume_size = 1
    }
  ]
}

output "device_names" {
  value = var.instance[*].device_name
}
```

**Use for loop to get attributes (optionally tranform them)**

```hcl-terraform
output "uppercase_device_names" {
  value = [for device in var.instance : upper(device.device_name)]
}
```

**Use loop for object keys**

```hcl-terraform
output "device_names2" {
  value = { for device_name in var.instance[*].device_name : device_name => upper(device_name) }
}
```

**Use for_each to create multiple resources**

```hcl-terraform
resource "aws_iam_user" "user_accounts" {
  for_each = toset(["Bob", "Alice"])
  name     = each.key
}
```
