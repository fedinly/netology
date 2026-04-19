output "network_name" {
  value = yandex_vpc_network.vpc_dev_net.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.vpc_dev_net.id
  description = "Network ID, for using in vm module"
}

output "subn_d_id" {
  value = yandex_vpc_subnet.vpc_dev_subn_d.id
  description = "Subnet to VM's in zone D"
}