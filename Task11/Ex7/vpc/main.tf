data "terraform_remote_state" "bucket" {
  backend = "s3"
  config = {
    bucket = "data.terraform_remote_state.bucket.outputs.bucket_name_out"
    key    = "vpc/terraform.tfstate"
    region = "ru-central1"
    endpoints = {
      s3 = "https://storage.yandexcloud.net"

    }
  }
}

resource "yandex_vpc_network" "dev_net" {
  name           = var.vpc_name
}

resource "yandex_vpc_subnet" "dev_subn_a" {
  name           = "${var.vpc_name}-${var.subnet_zones[0]}"
  network_id     = yandex_vpc_network.dev_net.id
  v4_cidr_blocks = [var.cidr_blocks[0]]
  zone           = var.subnet_zones[0]
}

resource "yandex_vpc_subnet" "dev_subn_d" {
  name           = "${var.vpc_name}-${var.subnet_zones[1]}"
  network_id     = yandex_vpc_network.dev_net.id
  v4_cidr_blocks = [var.cidr_blocks[1]]
  zone           = var.subnet_zones[1]
}

resource "yandex_vpc_subnet" "dev_subn_b" {
  name           = "${var.vpc_name}-${var.subnet_zones[2]}"
  network_id     = yandex_vpc_network.dev_net.id
  v4_cidr_blocks = [var.cidr_blocks[2]]
  zone           = var.subnet_zones[2]
}