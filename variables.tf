variable "intersight_api_key" {
  type        = string
  description = "API Key"
}
variable "intersight_secret_key" {
  type        = string
  description = "Secret Key or file location"
}
variable "intersight_endpoint" {
  type        = string
  description = "API Endpoint URL"
  default     = "https://www.intersight.com"
}
variable "iks_cluster_name" {
  type = string
  description = "Name of IKS Cluster."
}
