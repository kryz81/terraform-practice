## Debugging

**Enable debugging**

```shell script
TF_LOG=debug terraform apply
```

**Save log to file**

```shell script
TF_LOG_PATH=terraform.log TF_LOG=info terraform apply
```
