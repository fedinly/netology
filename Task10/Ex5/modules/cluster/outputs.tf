output "cluster_id" {
  description = "The ID of the MySQL cluster"
  value       = yandex_mdb_mysql_cluster.test_cluster.id
}

output "name" {
  description = "The name of the MySQL cluster"
  value       = yandex_mdb_mysql_cluster.test_cluster.name
}

output "hosts" {
  description = "List of host FQDNs in the MySQL cluster"
  value       = [for host in yandex_mdb_mysql_cluster.test_cluster.host : host.fqdn]
}
