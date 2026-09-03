vms_resources = {
  vm={
    cores         = 2
    memory        = 2
    core_fraction = 20
    hdd_size      = 8
    platform      = "standard-v3"
    hdd_type      = "network-hdd"
  }
}
vms_metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINr3q4XMUJOIlOWLSTiBku/QtmX2t4qtGtIaZW+wy52V fedinly@gmail.com"
}
