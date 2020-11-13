## Resources

**1. Create multiple instances of a resource**

```hcl-terraform
resource aws_instance "myinstance" {
  # create 3 ec2 instances
  count = 3

  tags = {
    # get current count index
    Name = "myinstance-${count.index}"
  }

  ami           = "ami-0c960b947cbb2dd16"
  instance_type = "t2.nano"
}
```

**Change resource name (terraform key) without recreating it**

```shell script
terraform state mv aws_instance.myinstance aws_instance.web
```
