vms_resources = {
  web={
    cores         = 2
    memory        = 1
    core_fraction = 5
    hdd_size      = 5
    hdd_type      = "network-hdd"
  }
}
vms_metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr3q4XMUJOIlOWLSTiBku/QtmX2t4qtGtIaZW+wy52V fedinly@gmail.com"
}

stor = {
  name          = "storage"
  cores         = 2
  memory        = 1
  core_fraction = 5
  hdd_size      = 5
  hdd_type      = "network-hdd"
}

each_vm = [ {
  vm_name     = "main"
  cpu         = 4
  ram         = 2
  disk_volume = 10
  fraction    = 20
  disk_type   = "network-ssd"
  },
  {
  vm_name     = "replica"
  cpu         = 2
  ram         = 1
  disk_volume = 8
  fraction    = 5
  disk_type   = "network-hdd"
  } ]

addition_disk = {
  size = 1
  type = "network-hdd"
  zone = "ru-central1-a"
}


