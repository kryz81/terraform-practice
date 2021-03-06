## Variables

**Create simple variable with default value**

```hcl-terraform
variable "myvar" {
  type = number
  default = 22
}
```

**Provide variable value from shell**

```shell script
terraform apply --var 'http_port=8888'
```

**Provide variables from file**

```shell script
terraform apply --var-file vars.env
```

**Create an object variable**

```hcl-terraform
variable "myobject" {
  type = object({
    port: number
    message: string
    enabled: bool
    tags: map(string)
  })
  default = {
    port: 8888
  }
}
```

**Create a tuple variable**

```hcl-terraform
variable  "mytuple" {
  type = tuple([string, number, bool])
  default = ["My User", 20, true]
}
```

**Create custom validation rule**

```hcl-terraform
variable "image" {
  type        = string
  description = "image path"
  default     = "https://host.name/default.png"

  validation {
    condition     = substr(var.image, 0, 5) == "https"
    error_message = "Image path must be a HTTPS address."
  }
}
```
