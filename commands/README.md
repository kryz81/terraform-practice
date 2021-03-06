## Useful commands

**Format all files in current directory and all subdirectories**

```shell script
terraform fmt -recursive
```

**Show providers used in current configuration**

```shell script
terraform providers
```

**Show current state in human-readable format**

```shell script
terraform show
```

**List all resources from state**

```shell script
terraform state list
```

**Mark resource to be destroyed and recreated on the next apply**

```shell script
terraform taint 'aws_instance.myinstance'
```

**Check changes to be applied without refreshing remote state**

```shell script
terraform plan --refresh=false
```
