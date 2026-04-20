output "network_name" {
  value = yandex_vpc_network.dev_net.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.dev_net.id
  description = "Network ID, for using in vm module"
}

output "subnet_id" {
  value=[yandex_vpc_subnet.dev_subn_a.id, yandex_vpc_subnet.dev_subn_d.id]
}

output "subn_a_id" {
  value = yandex_vpc_subnet.dev_subn_a.id
  description = "Subnet for MySQL Srvrs"
}

output "subn_d_id" {
  value = yandex_vpc_subnet.dev_subn_d.id
  description = "Subnet for MySQL Srvrs"
}