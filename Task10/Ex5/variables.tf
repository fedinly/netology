variable "public_key" {
  type    = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr3q4XMUJOIlOWLSTiBku/QtmX2t4qtGtIaZW+wy52V fedinly@gmail.com"
}

variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "env_name" {
  type        = string
  default     = "Cluster"
}
variable "subnet_zones" {
  type        = list(string)
  default     = []
}
variable "db_name" {
  type        = string
}
variable "db_user_name" {
  type        = string
}
variable "db_user_pw" {
  type        = string
}
variable "ha" {
  type        = bool
}
variable "vpc_name" {
  type        = string
}
variable "cidr_blocks" {
  type        = list(string)
}