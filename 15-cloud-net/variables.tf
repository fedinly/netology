variable "vms_resources" {
  description = "resourse config" 
}
variable "vms_metadata" {
  description = "metadata"
}

variable "subnet_zones" {
  type    = list(string)
  default = ["ru-central1-d"]
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["192.168.10.0/24"]
}

variable "vpc_name" {
  type    = string
  default = "cloud"
}
variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}
