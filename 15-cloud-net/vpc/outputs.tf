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
