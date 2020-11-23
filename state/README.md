## State

**Ignore state lock**

```shell script
terraform apply -lock=false
```

**Set timeout for terraform waiting for lock**

```shell script
terraform apply -lock-timeout=30s
```

**Remote backends supporting state locking**

1. S3
2. azurerm
3. Consul
4. gcs
5. http (optional)
6. Kubernetes
7. Manta

**Remote backends not supporting state locking**

1. Artifactory
2. 
