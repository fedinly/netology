terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_vpc_network" "cloud_net1" {
  name           = var.vpc_name
  folder_id      = var.folder_id
  #cloud_id       = var.cloud_id
}

resource "yandex_vpc_subnet" "cloud_subnets" {
  for_each = {
    "public" = "ru-central1-d"
    "private" = "ru-central1-b"
  }

  name           = "${each.key}"
  zone           = each.value
  network_id     = yandex_vpc_network.cloud_net1.id
  v4_cidr_blocks = ["192.168.${each.key == "public" ? 10 : 20}.0/24"]
  #route_table_id = yandex_vpc_route_table.nat-instance-route.id
}
