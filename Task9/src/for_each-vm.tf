variable "each_vm" {
  type = list(object({  
    vm_name=string 
    cpu=number
    ram=number
    fraction=number
    disk_volume=number
    disk_type=string
  }))
  default = []
}

resource "yandex_compute_instance" "db" {
  for_each = {
    for index, vm in var.each_vm: 
    vm.vm_name => vm
  }
  name = each.value.vm_name
  
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk_volume
      type = each.value.disk_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    user-data = local.user-data
  }
}
