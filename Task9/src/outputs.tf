variable "vms" {
  description = "vms"

  type = map(list(object(
    {
      name = string,
      id   = string,
      fqdn = string
    }))
  )
  default = {
    "web" = [ {
      name = "1"
      id = "fdfsf"
      fqdn = "fdefsdf.a.b"
    } ],
  }
}

output "storage" {
  value = "${zipmap(["name", "id", "fqdn"], [yandex_compute_instance.storage.name, yandex_compute_instance.storage.id, yandex_compute_instance.storage.fqdn])}"
}
output "instance_web" {
  value = zipmap(
    [for k, v in yandex_compute_instance.web : k],      # List of keys (names)
    [for k, v in yandex_compute_instance.web : {
      id =v.id,
      name = v.name,
      fqdn = v.fqdn }
    ]   # List of values (IDs)
  )
}
output "instance_db" {
  value = zipmap(
    [for k, v in yandex_compute_instance.db : k],      # List of keys (names)
    [for k, v in yandex_compute_instance.db : {
      id =v.id,
      name = v.name,
      fqdn = v.fqdn }
    ]   # List of values (IDs)
  )
}
/*output "instance_storage" {
  value = zipmap(
    [for k, v in yandex_compute_instance.storage : k],      # List of keys (names)
    [for k, v in yandex_compute_instance.storage : {
      id =v.id,
      name = v.name,
      fqdn = v.fqdn }
    ]   # List of values (IDs)
  )
}
*/