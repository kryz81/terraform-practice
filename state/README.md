## State

**Ignore state lock**

```shell script
terraform apply -lock=false
```

**Set timeout for terraform waiting for lock**

```shell script
terraform apply -lock-timetout=30 # 30 seconds
```
