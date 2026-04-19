terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"  ### some test 29.10.2025
}

resource "yandex_mdb_mysql_cluster" "test_cluster" {
  network_id  = var.network_id
  name        = var.env_name
  version     = var.version_sql
  environment = var.environment
  description = "MySQL Test Cluster"
   

  dynamic "host" {
    for_each = (var.ha ? range(var.ha_count) : [1])
    content {
      zone             = element(var.subnet_zones, host.key)
      subnet_id        = element(var.subnet_id, host.key)
      name             = "${var.env_name}-replica-${host.key + 1}"
      priority         = host.key * 10
      assign_public_ip = var.assign_public_ip
      
    }
  }
  resources {
    resource_preset_id = var.resource_preset_id
    disk_type_id       = var.disk_type_id
    disk_size          = var.disk_size
  }

}