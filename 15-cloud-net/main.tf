module "cloud_net" {
  source       = "./vpc"
  vpc_name     = "cloud_net"
  subnet_zones = ["ru-central1-b","ru-central1-d"]
  cidr_blocks  = ["192.168.10.0/24","192.168.20.0/24"]
  cloud_id       = var.cloud_id
  folder_id      = var.folder_id 
}

locals {
  subnet_id_list = module.cloud_net.subnet_details
  user-data = "${file("~/.ssh/id_ed25519.pub")}"
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_name
}

resource "yandex_compute_instance" "vm" {
  count           = 2
  name            = "vm-${count.index+1}"
  zone            = local.subnet_id_list[count.index % length(local.subnet_id_list)].zone
  platform_id     = var.vms_resources.vm.platform
 
  resources {
    cores         = var.vms_resources.vm.cores
    memory        = var.vms_resources.vm.memory
    core_fraction = var.vms_resources.vm.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu.image_id
      size        = var.vms_resources.vm.hdd_size
      type        = var.vms_resources.vm.hdd_type
    }
  }
  scheduling_policy {
    preemptible   = true
  }
  network_interface {
    subnet_id     = local.subnet_id_list[count.index % length(local.subnet_id_list)].id
    nat           = local.subnet_id_list[count.index % length(local.subnet_id_list)].name == "private" ? false : true
  }

  metadata = {
    ssh-keys = "ubuntu:${local.user-data}"
  }
}
