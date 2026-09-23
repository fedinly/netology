output "network_name" {
  value = yandex_vpc_network.db_net.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.db_net.id
  description = "Network ID, for using in vm module"
}

output "subnet_id" {
  value=[yandex_vpc_subnet.db_subn_a.id, yandex_vpc_subnet.db_subn_b.id]
}

output "subn_a_id" {
  value = yandex_vpc_subnet.db_subn_a.id
  description = "Subnet for MySQL Srvrs"
}

output "subn_d_id" {
  value = yandex_vpc_subnet.db_subn_b.id
  description = "Subnet for MySQL Srvrs"
}