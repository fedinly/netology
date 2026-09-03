variable "subnet_zones" {
  type    = list(string)
}

variable "cidr_blocks" {
  type    = list(string)
}

variable "vpc_name" {
  type    = string
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}
