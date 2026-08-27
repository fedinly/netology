output "network_name" {
  value = yandex_vpc_network.cloud_net.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.cloud_net.id
  description = "Network ID, for using in vm module"
}

output "subn_1_id" {
  value = yandex_vpc_subnet.vpc_subn_1.id
  description = "Subnet to Public VM's"
}

output "subn_2_id" {
  value = yandex_vpc_subnet.vpc_subn_2.id
  description = "Subnet to Private VM's"
}
