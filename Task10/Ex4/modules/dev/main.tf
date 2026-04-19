terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_vpc_network" "vpc_dev_net" {
  name           = var.env_name
}

resource "yandex_vpc_subnet" "vpc_dev_subn_d" {
  name           = "${var.env_name}-${var.subnets[0].zone}"
  network_id     = yandex_vpc_network.vpc_dev_net.id
  v4_cidr_blocks = [var.subnets[0].cidr]
  zone           = var.subnets[0].zone
}