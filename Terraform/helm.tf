provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "web" {
  name       = "web"
  chart      = "../Helm/web"
  namespace  = "default"
  cleanup_on_fail = true
}

resource "helm_release" "api" {
  name       = "api"
  chart      = "../Helm/api"
  namespace  = "default"
  cleanup_on_fail = true
}

resource "helm_release" "mysql" {
  name       = "mysql"
  chart      = "../Helm/mysql"
  namespace  = "default"
  cleanup_on_fail = true
}

