variable "subnets" {
  type   = list(object({
    zone = string
    cidr = string
  }))
  default = [{ zone = "ru-central1-a", cidr = "10.0.1.0/24" }]
}

variable "env_name" {
  type    = string
  default = "production"
}