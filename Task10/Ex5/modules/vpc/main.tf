terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
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