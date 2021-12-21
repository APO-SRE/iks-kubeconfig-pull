provider "intersight" {
apikey = var.intersight_api_key
secretkey = var.intersight_secret_key
endpoint = var.intersight_endpoint
}

data "intersight_kubernetes_cluster" "iks" {
name = var.iks_cluster_name
}

provider "kubernetes" {
host = yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.server
cluster_ca_certificate = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.certificate-authority-data)
client_certificate = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-certificate-data)
client_key = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-key-data)
}

output "host" {
  value = yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.server
}
output "cluster_ca_certificate" {
  value = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).clusters[0].cluster.certificate-authority-data)
}
output "client_certificate" {
  value = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-certificate-data)
}
output "client_key" {
  value = base64decode(yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config)).users[0].user.client-key-data)
}
