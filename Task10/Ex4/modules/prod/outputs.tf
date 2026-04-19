output "network_name" {
  value = yandex_vpc_network.vpc_prod_net.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.vpc_prod_net.id
  description = "Network ID, for using in vm module"
}

output "subn_a_id" {
  value = yandex_vpc_subnet.vpc_prod_subn_a.id
  description = "Subnet to VM's in zone A"
}

output "subn_b_id" {
  value = yandex_vpc_subnet.vpc_prod_subn_b.id
  description = "Subnet to VM's in zone B"
}

output "subn_d_id" {
  value = yandex_vpc_subnet.vpc_prod_subn_d.id
  description = "Subnet to VM's in zone D"
}