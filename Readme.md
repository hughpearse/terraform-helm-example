# Teerraform with IBM


```bash
foo@bar:~$ brew install terraform
foo@bar:~$ vim ./main.tf
```

```json
provider "helm" {
  kubernetes {
    config_context_cluster   = "minikube"
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "my-helm-mongo" {
  name       = "my-mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mongodb"
}
```

```bash
foo@bar:~$ minikube start
foo@bar:~$ terraform init
foo@bar:~$ terraform plan -out myplan
foo@bar:~$ terraform apply ./myplan
```

Make some changes

```bash
foo@bar:~$ helm delete my-mongodb
```

detect drift

```bash
foo@bar:~$ terraform refresh
foo@bar:~$ terraform plan -out myplan
foo@bar:~$ terraform apply ./myplan
```

Cleanup

```bash
foo@bar:~$ terraform destroy
```

