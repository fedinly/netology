variable "cluster_id" {
  type        = string
  description = "Existing cluster id"
}
variable "db_name" {
  type        = string
  default     = "db"
  description = "Database name"
}
variable "db_user_name" {
  type        = string
  default     = "user01"
  description = "Database User name"
}
variable "db_user_pw" {
  type        = string
  default     = ""
}