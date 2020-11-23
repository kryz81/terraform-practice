## Workspaces

**List workspaces**

```shell script
terraform workspace list
```

**Show current workspace**

```shell script
terraform workspace show
```

**Switch to workspace**

```shell script
terraform workspace select myworkspace1
```

**Set property value based on current workspace**

```hcl-terraform
resource "aws_instance" "myinstance" {
  ami = "ami-0c960b947cbb2dd16"
  instance_type = terraform.workspace == "myworkspace1" ? "t2.nano" : "t2.micro" 
}
```

**Add new workspace**

```shell script
terraform workspace new mynewwork1
```

**Delete workspace**

```shell script
terraform workspace delete mynewwork1
```

**Find state of custom workspace**

```shell script
ls terraform.tfstate.d/<namespace name>
```
