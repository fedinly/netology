variable "subnet_zones" {
  type    = list(string)
}

variable "cidr_blocks" {
  type    = list(string)
}

variable "vpc_name" {
  type    = string
  default = "net"
}
