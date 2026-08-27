terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_vpc_network" "cloud_net" {
  name           = var.vpc_name
}

resource "yandex_vpc_subnet" "vpc_subn_1" {
  name           = "public"
  network_id     = yandex_vpc_network.cloud_net.id
  v4_cidr_blocks = [var.cidr_blocks[0]]
  zone           = var.subnet_zones[0]
}

resource "yandex_vpc_subnet" "vpc_subn_2" {
  name           = "private"
  network_id     = yandex_vpc_network.cloud_net.id
  v4_cidr_blocks = [var.cidr_blocks[1]]
  zone           = var.subnet_zones[1]
}
