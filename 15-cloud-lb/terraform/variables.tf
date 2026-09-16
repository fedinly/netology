###cloud vars
# variable "public_key" {
#   type    = string
#   default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr3q4XMUJOIlOWLSTiBku/QtmX2t4qtGtIaZW+wy52V fedinly@gmail.com"
# }
variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "b1g628ugp5sfk4i1q9eh"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "b1gfrvrdfsaespelvb0u"
}
variable "sa_id" {
  type = string
}
###bucket
variable "bucket_name" {
  type = string
  description = "Bucket for Task 2"
}
variable "bucket_class" {
  type = string
  description = "Mandatory for class of bucket"
  default = "standard"
}

/*variable "vms_resources" {
  description = "resourse config" 
}
variable "vms_metadata" {
  description = "metadata"
}*/