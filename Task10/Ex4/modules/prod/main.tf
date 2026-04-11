terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_vpc_network" "vpc_prod_net" {
  name           = var.env_name
}

resource "yandex_vpc_subnet" "vpc_prod_subn_a" {
  name           = "${var.env_name}-${var.subnets[0].zone}"
  network_id     = yandex_vpc_network.vpc_prod_net.id
  v4_cidr_blocks = [var.subnets[0].cidr]
  zone           = var.subnets[0].zone
}

resource "yandex_vpc_subnet" "vpc_prod_subn_b" {
  name           = "${var.env_name}-${var.subnets[1].zone}"
  network_id     = yandex_vpc_network.vpc_prod_net.id
  v4_cidr_blocks = [var.subnets[1].cidr]
  zone           = var.subnets[1].zone
}

resource "yandex_vpc_subnet" "vpc_prod_subn_d" {
  name           = "${var.env_name}-${var.subnets[2].zone}"
  network_id     = yandex_vpc_network.vpc_prod_net.id
  v4_cidr_blocks = [var.subnets[2].cidr]
  zone           = var.subnets[2].zone
}