output "network_name" {
  value = yandex_vpc_network.cloud_net1.name
  description = "Network name to use in vm module"
}

output "network_id" {
  value = yandex_vpc_network.cloud_net1.id
  description = "Network ID, for using in vm module"
}

output "subnet_details" {
  value = [
    for s in yandex_vpc_subnet.cloud_subnets : {
      name = s.name
      id   = s.id
      zone = s.zone
    }
  ]
}
/*
output "subn_1_id" {
  value = yandex_vpc_subnet.vpc_subn_1.id
  description = "Subnet to Public VM's"
}

output "subn_2_id" {
  value = yandex_vpc_subnet.vpc_subn_2.id
  description = "Subnet to Private VM's"
}
*/