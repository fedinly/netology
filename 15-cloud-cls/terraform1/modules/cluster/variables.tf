variable "network_id" {
  type    = string
  default = ""  
}
variable "subnet_id" {
  type    = list(string)
  default = []  
}
variable "subnet_zones" {
  type    = list(string)
  default = []
}
variable "env_name" {
  type    = string
  default = "production"
}
variable "version_sql" {
  type    = string
  default = "8.0"
}
variable "environment" {
  type    = string
  default = "PRESTABLE"
}
variable "name" {
  type    = string
  default = ""
}
variable "deletion_protection" {
  type    = bool
  default = true
}
variable "ha" {
  type    = bool
  default = true
}
variable "ha_count" {
  type    = number
  default = 2
}
variable "assign_public_ip" {
  type    = bool
  default = false
}
variable "resource_preset_id" {
  type    = string
  default = "b1.medium"
}
variable "disk_type_id" {
  type    = string
  default = "network-hdd"
}
variable "disk_size" {
  type    = number
  default = 20
}
variable "db_backup_window" {
  description = "Время начала ежедневного бэкапа кластера БД (в часах и минутах по UTC)"
  type = object({
    hours   = number
    minutes = number
  })
  default = {
    hours   = 23
    minutes = 59
  }
}