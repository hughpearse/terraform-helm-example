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

