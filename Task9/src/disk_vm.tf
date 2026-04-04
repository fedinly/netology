variable "addition_disk" {
  description = "disks for storage vm"
  type        = object(
    {
      type = string,
      size = number,
      zone = string
    })
}

resource "yandex_compute_disk" "addition_disk" {
  count = 3
  name  = "disk-${count.index}"
  size  = var.addition_disk.size
  type  = var.addition_disk.type
  zone  = var.addition_disk.zone 
}
  
resource "yandex_compute_instance" "storage" {
  name = var.stor.name
  description = "vm with addition disks"

  resources {
    cores         = var.stor.cores
    memory        = var.stor.memory
    core_fraction = var.stor.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = var.stor.hdd_size
      type = var.stor.hdd_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.addition_disk.*.id
    content {
      disk_id = secondary_disk.value
    }
  }
}
